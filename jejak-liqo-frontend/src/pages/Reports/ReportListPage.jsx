import React, { useState } from 'react';
import { useQuery, useMutation } from '@tanstack/react-query';
import { Download, FileText, FileSpreadsheet, Calendar, Users, BookOpen, TrendingUp, Filter, X, Loader } from 'lucide-react';
import { downloadReport, getGroups, getMentors } from '../../api/report.service';
import Layout from '../../components/layout/Layout'; // ✅ Import Layout

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

  // Pastikan data yang diambil adalah array
  const groups = groupsData?.data?.data || [];
  const mentors = mentorsData?.data?.data || [];


  const reportTypes = [
    { id: 'attendance_summary', title: 'Laporan Kehadiran', description: 'Rekapitulasi kehadiran mentee per periode', icon: Users, color: 'blue'},
    { id: 'meeting_activity', title: 'Aktivitas Pertemuan', description: 'Detail pertemuan dan materi yang dibahas', icon: BookOpen, color: 'green'},
    { id: 'mentor_performance', title: 'Kinerja Mentor', description: 'Statistik aktivitas mentor per kelompok', icon: TrendingUp, color: 'purple'},
    { id: 'group_progress', title: 'Progress Kelompok', description: 'Perkembangan dan ringkasan per kelompok', icon: Users, color: 'orange'},
    { id: 'monthly_recap', title: 'Rekap Bulanan UPA PAS-PAA', description: 'Laporan lengkap seperti format Januari-Februari 2025', icon: Calendar, color: 'red'}
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
    if (!reportType || !dateRange.start || !dateRange.end) {
      alert('⚠️ Pilih jenis laporan dan rentang tanggal terlebih dahulu!');
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
    // ✅ Gunakan Layout
    <Layout title="Sistem Laporan">
      <div className="max-w-7xl mx-auto">
       
        {/* Loading Overlay */}
        {isLoading && (
          <div className="fixed inset-0 bg-black bg-opacity-60 flex items-center justify-center z-50">
            {/* ✅ Overlay disesuaikan tema */}
            <div className="bg-surface rounded-lg p-8 flex flex-col items-center gap-4 shadow-xl">
              <Loader className="w-12 h-12 text-primary animate-spin" />
              <p className="text-lg font-semibold text-text">Generating laporan...</p>
              <p className="text-sm text-muted">Mohon tunggu sebentar</p>
            </div>
          </div>
        )}

        {/* Filter Section */}
        {/* ✅ bg-surface, text-text */}
        <div className="bg-surface rounded-lg shadow-sm p-6 mb-6">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-xl font-semibold text-text flex items-center gap-2">
              <Filter size={20} />
              Filter Laporan
            </h2>
            <button
              onClick={() => setShowFilters(!showFilters)}
              className="text-sm text-primary hover:text-primary-hover" // Gunakan warna primer
            >
              {showFilters ? 'Sembunyikan' : 'Tampilkan'} Filter Lanjutan
            </button>
          </div>

          <div className="space-y-4">
            {/* Date Range */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                {/* ✅ text-muted */}
                <label className="block text-sm font-medium text-muted mb-1">
                  Tanggal Mulai <span className="text-red-500">*</span>
                </label>
                {/* ✅ bg-surface, border-border, text-text, focus:ring-primary */}
                <input
                  type="date"
                  value={dateRange.start}
                  onChange={(e) => setDateRange({ ...dateRange, start: e.target.value })}
                  className="w-full px-4 py-2 border border-border rounded-lg bg-surface text-text focus:ring-2 focus:ring-primary focus:border-transparent"
                  required
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-muted mb-1">
                  Tanggal Akhir <span className="text-red-500">*</span>
                </label>
                <input
                  type="date"
                  value={dateRange.end}
                  onChange={(e) => setDateRange({ ...dateRange, end: e.target.value })}
                  min={dateRange.start}
                  className="w-full px-4 py-2 border border-border rounded-lg bg-surface text-text focus:ring-2 focus:ring-primary focus:border-transparent"
                  required
                />
              </div>
            </div>

            {/* Advanced Filters */}
            {showFilters && (
            
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 pt-4 border-t border-border">
                <div>
                  <label className="block text-sm font-medium text-muted mb-1">
                    Kelompok
                  </label>
                  <select
                    value={selectedGroup}
                    onChange={(e) => setSelectedGroup(e.target.value)}
                    className="w-full px-4 py-2 border border-border rounded-lg bg-surface text-text focus:ring-2 focus:ring-primary focus:border-transparent"
                  >
                    <option value="all">Semua Kelompok</option>
                    {groups.map(group => (
                      <option key={group.id} value={group.id}>{group.group_name}</option>
                    ))}
                  </select>
                </div>
                <div>
                  <label className="block text-sm font-medium text-muted mb-1">
                    Mentor
                  </label>
                  <select
                    value={selectedMentor}
                    onChange={(e) => setSelectedMentor(e.target.value)}
                    className="w-full px-4 py-2 border border-border rounded-lg bg-surface text-text focus:ring-2 focus:ring-primary focus:border-transparent"
                  >
                    <option value="all">Semua Mentor</option>
                    {mentors.map(mentor => (
                      <option key={mentor.id} value={mentor.id}>{mentor.full_name}</option>
                    ))}
                  </select>
                </div>
              </div>
            )}

            {(dateRange.start || dateRange.end || selectedGroup !== 'all' || selectedMentor !== 'all') && (
      
              <button
                onClick={resetFilters}
                className="flex items-center gap-1 text-sm text-muted hover:text-text"
              >
                <X size={16} />
                Reset Filter
              </button>
            )}
          </div>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-6">
          {reportTypes.map((report) => {
            const Icon = report.icon;
            const isSelected = reportType === report.id;
        
            const colorClasses = {
              blue: 'bg-blue-500/10 border-primary text-primary dark:text-sky-400 dark:border-sky-400',
              green: 'bg-green-500/10 border-green-500 text-green-700 dark:text-green-400 dark:border-green-400',
              purple: 'bg-purple-500/10 border-purple-500 text-purple-700 dark:text-purple-400 dark:border-purple-400',
              orange: 'bg-orange-500/10 border-orange-500 text-orange-700 dark:text-orange-400 dark:border-orange-400',
              red: 'bg-red-500/10 border-red-500 text-red-700 dark:text-red-400 dark:border-red-400'
            };
            const selectedBgColorClass = { // Untuk ikon centang
              blue: 'bg-primary dark:bg-sky-400',
              green: 'bg-green-500 dark:bg-green-400',
              purple: 'bg-purple-500 dark:bg-purple-400',
              orange: 'bg-orange-500 dark:bg-orange-400',
              red: 'bg-red-500 dark:bg-red-400'
            };

            return (
              <button
                key={report.id}
                onClick={() => setReportType(report.id)}
                disabled={isLoading}
                // ✅ bg-surface (unselected), border-border, hover:border-gray-300 dark:hover:border-gray-600
                className={`relative p-6 rounded-lg border-2 transition-all text-left ${
                  isSelected
                    ? `${colorClasses[report.color]} shadow-lg scale-105`
                    : 'bg-surface border-border hover:border-gray-300 dark:hover:border-gray-600 hover:shadow-md'
                } ${isLoading ? 'opacity-50 cursor-not-allowed' : ''}`}
              >
                {isSelected && (
                  <div className="absolute top-2 right-2">
                     {/* ✅ Gunakan selectedBgColorClass */}
                    <div className={`w-6 h-6 rounded-full flex items-center justify-center ${selectedBgColorClass[report.color]}`}>
                      <svg className="w-4 h-4 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                      </svg>
                    </div>
                  </div>
                )}
                {/* ✅ Ikon warna disesuaikan */}
                <Icon className={`w-10 h-10 mb-4 ${
                  isSelected ? colorClasses[report.color].split(' ').find(c => c.startsWith('text-')) : 'text-muted' // Ambil warna teks dari colorClasses
                }`} />
                {/* ✅ text-text */}
                <h3 className="text-lg font-semibold text-text mb-2">{report.title}</h3>
                {/* ✅ text-muted */}
                <p className="text-sm text-muted">{report.description}</p>
              </button>
            );
          })}
        </div>

        {/* Generate Buttons */}
        {reportType && dateRange.start && dateRange.end && (
          // ✅ bg-surface
          <div className="bg-surface rounded-lg shadow-sm p-6">
            {/* ✅ text-text */}
            <h3 className="text-lg font-semibold text-text mb-4">Generate Laporan</h3>
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
            {/* ✅ bg-background, text-muted */}
            <div className="mt-4 p-4 bg-background rounded-lg">
              <p className="text-sm text-muted">
                <strong>Laporan terpilih:</strong> {reportTypes.find(r => r.id === reportType)?.title}
              </p>
              <p className="text-sm text-muted mt-1">
                <strong>Periode:</strong> {new Date(dateRange.start).toLocaleDateString('id-ID', { day: 'numeric', month: 'long', year: 'numeric' })} - {new Date(dateRange.end).toLocaleDateString('id-ID', { day: 'numeric', month: 'long', year: 'numeric' })}
              </p>
              {selectedGroup !== 'all' && (
                <p className="text-sm text-muted mt-1">
                  <strong>Kelompok:</strong> {groups.find(g => g.id === parseInt(selectedGroup))?.group_name}
                </p>
              )}
              {selectedMentor !== 'all' && (
                <p className="text-sm text-muted mt-1">
                  <strong>Mentor:</strong> {mentors.find(m => m.id === parseInt(selectedMentor))?.full_name}
                </p>
              )}
            </div>
          </div>
        )}

        {/* Info Section */}
        {/* ✅ Sesuaikan warna info box */}
        <div className="mt-8 bg-primary/10 border border-primary/20 rounded-lg p-6">
          <h3 className="text-lg font-semibold text-primary dark:text-sky-400 mb-2">📋 Informasi</h3>
          <ul className="space-y-2 text-sm text-primary/80 dark:text-sky-400/80">
            <li>• Pilih jenis laporan yang ingin di-generate</li>
            <li>• Tentukan rentang tanggal untuk periode laporan</li>
            <li>• Gunakan filter lanjutan untuk laporan yang lebih spesifik</li>
            <li>• Laporan akan langsung ter-download setelah proses selesai</li>
            <li>• Format PDF cocok untuk presentasi dan dokumentasi</li>
            <li>• Format Excel cocok untuk analisis dan pengolahan data lebih lanjut</li>
          </ul>
        </div>
      </div>
    </Layout> // ✅ Tutup Layout
  );
};

export default ReportListPage;