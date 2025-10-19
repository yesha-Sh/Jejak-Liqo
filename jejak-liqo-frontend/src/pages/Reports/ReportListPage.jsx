import React, { useState } from 'react';
import { useQuery, useMutation } from '@tanstack/react-query';
import { Download, FileText, FileSpreadsheet, Calendar, Users, BookOpen, TrendingUp, Filter, X, Loader } from 'lucide-react';
import { downloadReport, getGroups, getMentors } from '../../api/report.service';

const ReportListPage = () => {
  const [reportType, setReportType] = useState('');
  const [dateRange, setDateRange] = useState({ start: '', end: '' });
  const [selectedGroup, setSelectedGroup] = useState('all');
  const [selectedMentor, setSelectedMentor] = useState('all');
  const [showFilters, setShowFilters] = useState(false);

  // Fetch groups dan mentors dari API
  const { data: groupsData } = useQuery({
    queryKey: ['groups'],
    queryFn: getGroups,
  });

  const { data: mentorsData } = useQuery({
    queryKey: ['mentors'],
    queryFn: getMentors,
  });

  const groups = groupsData?.data || [];
  const mentors = mentorsData?.data || [];

  const reportTypes = [
    {
      id: 'attendance_summary',
      title: 'Laporan Kehadiran',
      description: 'Rekapitulasi kehadiran mentee per periode',
      icon: Users,
      color: 'blue'
    },
    {
      id: 'meeting_activity',
      title: 'Aktivitas Pertemuan',
      description: 'Detail pertemuan dan materi yang dibahas',
      icon: BookOpen,
      color: 'green'
    },
    {
      id: 'mentor_performance',
      title: 'Kinerja Mentor',
      description: 'Statistik aktivitas mentor per kelompok',
      icon: TrendingUp,
      color: 'purple'
    },
    {
      id: 'group_progress',
      title: 'Progress Kelompok',
      description: 'Perkembangan dan ringkasan per kelompok',
      icon: Users,
      color: 'orange'
    },
    {
      id: 'monthly_recap',
      title: 'Rekap Bulanan UPA PAS-PAA',
      description: 'Laporan lengkap seperti format Januari-Februari 2025',
      icon: Calendar,
      color: 'red'
    }
  ];

  // Mutation untuk download report
  const downloadMutation = useMutation({
    mutationFn: downloadReport,
    onSuccess: (data) => {
      alert(`✅ Laporan berhasil diunduh: ${data.filename}`);
    },
    onError: (error) => {
      alert(`❌ Gagal mengunduh laporan: ${error.message}`);
    }
  });

  const handleGenerateReport = (format) => {
    if (!reportType) {
      alert('⚠️ Pilih jenis laporan terlebih dahulu!');
      return;
    }

    if (!dateRange.start || !dateRange.end) {
      alert('⚠️ Pilih rentang tanggal terlebih dahulu!');
      return;
    }

    const params = {
      type: reportType,
      format: format,
      start_date: dateRange.start,
      end_date: dateRange.end,
      group_id: selectedGroup !== 'all' ? selectedGroup : undefined,
      mentor_id: selectedMentor !== 'all' ? selectedMentor : undefined
    };

    downloadMutation.mutate(params);
  };

  const resetFilters = () => {
    setReportType('');
    setDateRange({ start: '', end: '' });
    setSelectedGroup('all');
    setSelectedMentor('all');
  };

  const isLoading = downloadMutation.isLoading;

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900 mb-2">Sistem Laporan</h1>
          <p className="text-gray-600">Generate laporan kegiatan mentoring dalam format PDF atau Excel</p>
        </div>

        {/* Loading Overlay */}
        {isLoading && (
          <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
            <div className="bg-white rounded-lg p-8 flex flex-col items-center gap-4">
              <Loader className="w-12 h-12 text-blue-600 animate-spin" />
              <p className="text-lg font-semibold text-gray-900">Generating laporan...</p>
              <p className="text-sm text-gray-600">Mohon tunggu sebentar</p>
            </div>
          </div>
        )}

        {/* Filter Section */}
        <div className="bg-white rounded-lg shadow-sm p-6 mb-6">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-xl font-semibold text-gray-900 flex items-center gap-2">
              <Filter size={20} />
              Filter Laporan
            </h2>
            <button
              onClick={() => setShowFilters(!showFilters)}
              className="text-sm text-blue-600 hover:text-blue-700"
            >
              {showFilters ? 'Sembunyikan' : 'Tampilkan'} Filter Lanjutan
            </button>
          </div>

          <div className="space-y-4">
            {/* Date Range */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Tanggal Mulai <span className="text-red-500">*</span>
                </label>
                <input
                  type="date"
                  value={dateRange.start}
                  onChange={(e) => setDateRange({ ...dateRange, start: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  required
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Tanggal Akhir <span className="text-red-500">*</span>
                </label>
                <input
                  type="date"
                  value={dateRange.end}
                  onChange={(e) => setDateRange({ ...dateRange, end: e.target.value })}
                  min={dateRange.start}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  required
                />
              </div>
            </div>

            {/* Advanced Filters */}
            {showFilters && (
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 pt-4 border-t">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Kelompok
                  </label>
                  <select
                    value={selectedGroup}
                    onChange={(e) => setSelectedGroup(e.target.value)}
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  >
                    <option value="all">Semua Kelompok</option>
                    {groups.map(group => (
                      <option key={group.id} value={group.id}>{group.group_name}</option>
                    ))}
                  </select>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Mentor
                  </label>
                  <select
                    value={selectedMentor}
                    onChange={(e) => setSelectedMentor(e.target.value)}
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  >
                    <option value="all">Semua Mentor</option>
                    {mentors.map(mentor => (
                      <option key={mentor.id} value={mentor.id}>{mentor.full_name}</option>
                    ))}
                  </select>
                </div>
              </div>
            )}

            {/* Reset Button */}
            {(dateRange.start || dateRange.end || selectedGroup !== 'all' || selectedMentor !== 'all') && (
              <button
                onClick={resetFilters}
                className="flex items-center gap-2 text-sm text-gray-600 hover:text-gray-900"
              >
                <X size={16} />
                Reset Filter
              </button>
            )}
          </div>
        </div>

        {/* Report Types Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-6">
          {reportTypes.map((report) => {
            const Icon = report.icon;
            const isSelected = reportType === report.id;
            const colorClasses = {
              blue: 'bg-blue-50 border-blue-500 text-blue-700',
              green: 'bg-green-50 border-green-500 text-green-700',
              purple: 'bg-purple-50 border-purple-500 text-purple-700',
              orange: 'bg-orange-50 border-orange-500 text-orange-700',
              red: 'bg-red-50 border-red-500 text-red-700'
            };

            return (
              <button
                key={report.id}
                onClick={() => setReportType(report.id)}
                disabled={isLoading}
                className={`relative p-6 rounded-lg border-2 transition-all text-left ${
                  isSelected
                    ? `${colorClasses[report.color]} shadow-lg scale-105`
                    : 'bg-white border-gray-200 hover:border-gray-300 hover:shadow-md'
                } ${isLoading ? 'opacity-50 cursor-not-allowed' : ''}`}
              >
                {isSelected && (
                  <div className="absolute top-2 right-2">
                    <div className={`w-6 h-6 rounded-full flex items-center justify-center ${
                      report.color === 'blue' ? 'bg-blue-500' :
                      report.color === 'green' ? 'bg-green-500' :
                      report.color === 'purple' ? 'bg-purple-500' :
                      report.color === 'orange' ? 'bg-orange-500' :
                      'bg-red-500'
                    }`}>
                      <svg className="w-4 h-4 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                      </svg>
                    </div>
                  </div>
                )}
                <Icon className={`w-10 h-10 mb-4 ${
                  isSelected 
                    ? report.color === 'blue' ? 'text-blue-600' :
                      report.color === 'green' ? 'text-green-600' :
                      report.color === 'purple' ? 'text-purple-600' :
                      report.color === 'orange' ? 'text-orange-600' :
                      'text-red-600'
                    : 'text-gray-400'
                }`} />
                <h3 className="text-lg font-semibold text-gray-900 mb-2">{report.title}</h3>
                <p className="text-sm text-gray-600">{report.description}</p>
              </button>
            );
          })}
        </div>

        {/* Generate Buttons */}
        {reportType && dateRange.start && dateRange.end && (
          <div className="bg-white rounded-lg shadow-sm p-6">
            <h3 className="text-lg font-semibold text-gray-900 mb-4">Generate Laporan</h3>
            <div className="flex flex-wrap gap-4">
              <button
                onClick={() => handleGenerateReport('pdf')}
                disabled={isLoading}
                className="flex items-center gap-2 px-6 py-3 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors shadow-md hover:shadow-lg disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {isLoading ? <Loader size={20} className="animate-spin" /> : <FileText size={20} />}
                Download PDF
              </button>
              <button
                onClick={() => handleGenerateReport('xlsx')}
                disabled={isLoading}
                className="flex items-center gap-2 px-6 py-3 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors shadow-md hover:shadow-lg disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {isLoading ? <Loader size={20} className="animate-spin" /> : <FileSpreadsheet size={20} />}
                Download Excel
              </button>
            </div>
            
            {/* Info Summary */}
            <div className="mt-4 p-4 bg-gray-50 rounded-lg">
              <p className="text-sm text-gray-600">
                <strong>Laporan terpilih:</strong> {reportTypes.find(r => r.id === reportType)?.title}
              </p>
              <p className="text-sm text-gray-600 mt-1">
                <strong>Periode:</strong> {new Date(dateRange.start).toLocaleDateString('id-ID', { day: 'numeric', month: 'long', year: 'numeric' })} - {new Date(dateRange.end).toLocaleDateString('id-ID', { day: 'numeric', month: 'long', year: 'numeric' })}
              </p>
              {selectedGroup !== 'all' && (
                <p className="text-sm text-gray-600 mt-1">
                  <strong>Kelompok:</strong> {groups.find(g => g.id === parseInt(selectedGroup))?.group_name}
                </p>
              )}
              {selectedMentor !== 'all' && (
                <p className="text-sm text-gray-600 mt-1">
                  <strong>Mentor:</strong> {mentors.find(m => m.id === parseInt(selectedMentor))?.full_name}
                </p>
              )}
            </div>
          </div>
        )}

        {/* Info Section */}
        <div className="mt-8 bg-blue-50 border border-blue-200 rounded-lg p-6">
          <h3 className="text-lg font-semibold text-blue-900 mb-2">📋 Informasi</h3>
          <ul className="space-y-2 text-sm text-blue-800">
            <li>• Pilih jenis laporan yang ingin di-generate</li>
            <li>• Tentukan rentang tanggal untuk periode laporan</li>
            <li>• Gunakan filter lanjutan untuk laporan yang lebih spesifik</li>
            <li>• Laporan akan langsung ter-download setelah proses selesai</li>
            <li>• Format PDF cocok untuk presentasi dan dokumentasi</li>
            <li>• Format Excel cocok untuk analisis dan pengolahan data lebih lanjut</li>
          </ul>
        </div>
      </div>
    </div>
  );
};

export default ReportListPage;