import React, { useState } from 'react';
import Layout from '../../components/layout/Layout';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { getMeetings, createMeeting, updateMeeting, deleteMeeting } from '../../api/meeting.service';
import { getGroups } from '../../api/group.service';
import Table from '../../components/ui/Table';
import Button from '../../components/ui/Button';
import Modal from '../../components/ui/Modal';
import MeetingForm from '../../components/forms/MeetingForm';
import { Edit, Trash2, PlusCircle, CalendarCheck2 } from 'lucide-react';
import { format } from 'date-fns';
import { id } from 'date-fns/locale';
import { Link } from 'react-router-dom'; 

const MeetingListPage = () => {
  const queryClient = useQueryClient();
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingMeeting, setEditingMeeting] = useState(null);

  const { data: meetingsData, isLoading: isLoadingMeetings } = useQuery({
    queryKey: ['meetings'],
    queryFn: getMeetings,
  });

  const { data: groupsData, isLoading: isLoadingGroups } = useQuery({
    queryKey: ['groups'],
    queryFn: getGroups,
  });

  const { mutate: createMeetingMutation, isLoading: isCreating } = useMutation({
    mutationFn: createMeeting,
    onSuccess: () => {
      alert('Pertemuan berhasil dibuat');
      queryClient.invalidateQueries(['meetings']);
      closeModal();
    },
    onError: (err) => alert(`Gagal: ${err.message}`),
  });
  
  const { mutate: updateMeetingMutation, isLoading: isUpdating } = useMutation({
    mutationFn: (data) => updateMeeting(editingMeeting.id, data),
    onSuccess: () => {
      alert('Pertemuan berhasil diperbarui');
      queryClient.invalidateQueries(['meetings']);
      closeModal();
    },
    onError: (err) => alert(`Gagal: ${err.message}`),
  });

  const { mutate: deleteMeetingMutation } = useMutation({
    mutationFn: deleteMeeting,
    onSuccess: () => {
      alert('Pertemuan berhasil dihapus');
      queryClient.invalidateQueries(['meetings']);
    },
    onError: (err) => alert(`Gagal: ${err.message}`),
  });

  const openModalForCreate = () => {
    setEditingMeeting(null);
    setIsModalOpen(true);
  };

  const openModalForEdit = (meeting) => {
    const formattedMeeting = {
      ...meeting,
      meeting_date: meeting.meeting_date
        ? new Date(meeting.meeting_date).toISOString().split('T')[0]
        : '',
    };
    setEditingMeeting(formattedMeeting);
    setIsModalOpen(true);
  };

  const closeModal = () => {
    setEditingMeeting(null);
    setIsModalOpen(false);
  };
  
  const handleFormSubmit = (data) => {
    editingMeeting ? updateMeetingMutation(data) : createMeetingMutation(data);
  };

  const handleDelete = (id) => {
    if (window.confirm('Yakin ingin menghapus pertemuan ini?')) {
      deleteMeetingMutation(id);
    }
  };

  const columns = [
    { key: 'topic', header: 'Topik' },
    { key: 'group_name', header: 'Grup', render: (item) => item.group?.group_name || 'N/A' },
    { key: 'meeting_date', header: 'Tanggal', render: (item) => format(new Date(item.meeting_date), 'd MMMM yyyy', { locale: id })},
    { key: 'place', header: 'Tempat' },
    { key: 'meeting_type', header: 'Tipe' },
  ];
  
  const isLoading = isLoadingMeetings || isLoadingGroups;

  return (
    <Layout title="Manajemen Pertemuan">
      <div className="space-y-4">
        <div className="flex justify-between items-center">
          <h2 className="text-xl font-semibold">Daftar Pertemuan</h2>
          <Button onClick={openModalForCreate}>
            <PlusCircle size={16} className="mr-2" />
            Tambah Pertemuan
          </Button>
        </div>

        {isLoading ? (
          <p>Loading...</p>
        ) : (
          <Table
            columns={columns}
            data={meetingsData?.data?.data || []}
            renderActions={(meeting) => (
              <div className="flex space-x-2">
                {/* ✅ Tombol Absensi diubah menjadi Link */}
                <Link
                  to={`/meetings/${meeting.id}/attendance`}
                  title="Absensi"
                  className="p-1 text-green-600 hover:text-green-800"
                >
                  <CalendarCheck2 size={18} />
                </Link>

                <button
                  title="Edit"
                  onClick={() => openModalForEdit(meeting)}
                  className="p-1 text-blue-600 hover:text-blue-800"
                >
                  <Edit size={18} />
                </button>

                <button
                  title="Hapus"
                  onClick={() => handleDelete(meeting.id)}
                  className="p-1 text-red-600 hover:text-red-800"
                >
                  <Trash2 size={18} />
                </button>
              </div>
            )}
          />
        )}
      </div>

      <Modal 
        isOpen={isModalOpen}
        onClose={closeModal}
        title={editingMeeting ? 'Edit Pertemuan' : 'Tambah Pertemuan Baru'}
      >
        <MeetingForm
          defaultValues={editingMeeting}
          groups={groupsData?.data || []}
          onSubmit={handleFormSubmit}
          isLoading={isCreating || isUpdating}
        />
      </Modal>
    </Layout>
  );
};

export default MeetingListPage;
