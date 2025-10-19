import React, { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { getMeetingById } from '../../api/meeting.service';
import { saveBulkAttendance } from '../../api/attendance.service.js';
import Layout from '../../components/layout/Layout';
import Button from '../../components/ui/Button';
import { ArrowLeft } from 'lucide-react';
import { format } from 'date-fns';
import { id } from 'date-fns/locale';

const attendanceStatuses = ['Hadir', 'Izin', 'Sakit', 'Alfa'];

const AttendancePage = () => {
  const { meetingId } = useParams();
  const queryClient = useQueryClient();
  const [attendanceData, setAttendanceData] = useState({});

  const { data: meeting, isLoading, error } = useQuery({
    queryKey: ['meeting', meetingId],
    queryFn: () => getMeetingById(meetingId),
  });

  // Inisialisasi state absensi saat data meeting sudah ada
  useEffect(() => {
    if (meeting?.data) {
      const initialAttendance = {};
      meeting.data.group.mentees.forEach(mentee => {
        const existingAttendance = meeting.data.attendances.find(att => att.mentee_id === mentee.id);
        initialAttendance[mentee.id] = existingAttendance ? existingAttendance.status : 'Hadir';
      });
      setAttendanceData(initialAttendance);
    }
  }, [meeting]);

  const { mutate: saveAttendanceMutation, isLoading: isSaving } = useMutation({
    mutationFn: saveBulkAttendance,
    onSuccess: () => {
      alert('Absensi berhasil disimpan!');
      queryClient.invalidateQueries(['meeting', meetingId]);
    },
    onError: (err) => {
      alert(`Gagal menyimpan absensi: ${err.message}`);
    }
  });

  const handleStatusChange = (menteeId, status) => {
    setAttendanceData(prev => ({ ...prev, [menteeId]: status }));
  };

  const handleSubmit = () => {
    const payload = {
      meeting_id: meetingId,
      attendances: Object.entries(attendanceData).map(([mentee_id, status]) => ({
        mentee_id: parseInt(mentee_id),
        status,
        notes: '' // notes bisa ditambahkan di masa depan
      })),
    };
    saveAttendanceMutation(payload);
  };
  
  if (isLoading) return <Layout title="Absensi"><p>Loading...</p></Layout>;
  if (error) return <Layout title="Absensi"><p>Error: Gagal memuat data pertemuan.</p></Layout>;

  const { topic, meeting_date, group } = meeting.data;

  return (
    <Layout title={`Absensi: ${topic}`}>
      <div className="max-w-4xl mx-auto">
        <Link to="/meetings" className="inline-flex items-center gap-2 mb-4 text-sm text-primary hover:underline">
          <ArrowLeft size={16} />
          Kembali ke Daftar Pertemuan
        </Link>

        <div className="p-6 bg-white rounded-lg shadow-md">
          <div className="pb-4 mb-4 border-b">
            <h2 className="text-xl font-semibold">{topic}</h2>
            <p className="text-gray-500">{group.group_name} - {format(new Date(meeting_date), 'EEEE, d MMMM yyyy', { locale: id })}</p>
          </div>

          <div className="space-y-4">
            {group.mentees.map((mentee) => (
              <div key={mentee.id} className="flex flex-col sm:flex-row items-center justify-between p-3 border rounded-md">
                <p className="font-medium text-gray-800">{mentee.full_name}</p>
                <div className="flex items-center gap-x-3 mt-2 sm:mt-0">
                  {attendanceStatuses.map(status => (
                    <button
                      key={status}
                      onClick={() => handleStatusChange(mentee.id, status)}
                      className={`px-3 py-1 text-sm rounded-full transition-colors ${
                        attendanceData[mentee.id] === status
                          ? 'bg-primary text-white font-semibold'
                          : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
                      }`}
                    >
                      {status}
                    </button>
                  ))}
                </div>
              </div>
            ))}
          </div>
          
          <div className="flex justify-end mt-6">
            <Button onClick={handleSubmit} disabled={isSaving}>
              {isSaving ? 'Menyimpan...' : 'Simpan Absensi'}
            </Button>
          </div>
        </div>
      </div>
    </Layout>
  );
};

export default AttendancePage; 