import React, { useState } from 'react';
import Layout from '../../components/layout/Layout';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { getMentees, createMentee, updateMentee, deleteMentee } from '../../api/mentee.service';
import { getGroups } from '../../api/group.service';
import Table from '../../components/ui/Table';
import Button from '../../components/ui/Button';
import Modal from '../../components/ui/Modal';
import MenteeForm from '../../components/forms/MenteeForm';
import { Edit, Trash2, PlusCircle } from 'lucide-react';

const MenteeListPage = () => {
  const queryClient = useQueryClient();
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingMentee, setEditingMentee] = useState(null);

  const { data: menteesData, isLoading: isLoadingMentees } = useQuery({
    queryKey: ['mentees'],
    queryFn: getMentees,
  });

  const { data: groupsData, isLoading: isLoadingGroups } = useQuery({
    queryKey: ['groups'],
    queryFn: getGroups,
  });

  const { mutate: createMenteeMutation, isLoading: isCreating } = useMutation({
    mutationFn: createMentee,
    onSuccess: () => {
      alert('Mentee berhasil dibuat');
      queryClient.invalidateQueries(['mentees']);
      closeModal();
    },
    onError: (err) => alert(`Gagal: ${err.message}`),
  });
  
  const { mutate: updateMenteeMutation, isLoading: isUpdating } = useMutation({
    mutationFn: (data) => updateMentee(editingMentee.id, data),
    onSuccess: () => {
      alert('Mentee berhasil diperbarui');
      queryClient.invalidateQueries(['mentees']);
      closeModal();
    },
     onError: (err) => alert(`Gagal: ${err.message}`),
  });

  const { mutate: deleteMenteeMutation } = useMutation({
    mutationFn: deleteMentee,
    onSuccess: () => {
      alert('Mentee berhasil dihapus');
      queryClient.invalidateQueries(['mentees']);
    },
    onError: (err) => alert(`Gagal: ${err.message}`),
  });

  const openModalForCreate = () => {
    setEditingMentee(null);
    setIsModalOpen(true);
  };

  const openModalForEdit = (mentee) => {
    // Format tanggal untuk input type="date"
    const formattedMentee = {
      ...mentee,
      birth_date: mentee.birth_date ? new Date(mentee.birth_date).toISOString().split('T')[0] : '',
    };
    setEditingMentee(formattedMentee);
    setIsModalOpen(true);
  };

  const closeModal = () => {
    setEditingMentee(null);
    setIsModalOpen(false);
  };
  
  const handleFormSubmit = (data) => {
    editingMentee ? updateMenteeMutation(data) : createMenteeMutation(data);
  };

  const handleDelete = (id) => {
    if (window.confirm('Yakin ingin menghapus mentee ini?')) {
      deleteMenteeMutation(id);
    }
  };

  const columns = [
    { key: 'full_name', header: 'Nama Lengkap' },
    { key: 'group_name', header: 'Grup', render: (item) => item.group?.group_name || 'N/A' },
    { key: 'phone_number', header: 'No. Telepon' },
    { key: 'status', header: 'Status' },
  ];
  
  const isLoading = isLoadingMentees || isLoadingGroups;

  return (
    <Layout title="Manajemen Mentee">
      <div className="space-y-4">
        <div className="flex justify-between items-center">
          <h2 className="text-xl font-semibold">Daftar Mentee</h2>
          <Button onClick={openModalForCreate}>
            <PlusCircle size={16} className="mr-2" />
            Tambah Mentee
          </Button>
        </div>
        {isLoading ? <p>Loading...</p> : (
          <Table
            columns={columns}
            data={menteesData?.data?.data || []}
            renderActions={(mentee) => (
              <div className="flex space-x-2">
                <button onClick={() => openModalForEdit(mentee)} className="text-blue-600 hover:text-blue-800"><Edit size={18} /></button>
                <button onClick={() => handleDelete(mentee.id)} className="text-red-600 hover:text-red-800"><Trash2 size={18} /></button>
              </div>
            )}
          />
        )}
      </div>

      <Modal 
        isOpen={isModalOpen}
        onClose={closeModal}
        title={editingMentee ? 'Edit Mentee' : 'Tambah Mentee Baru'}
      >
        <MenteeForm
          defaultValues={editingMentee}
          groups={groupsData?.data || []}
          onSubmit={handleFormSubmit}
          isLoading={isCreating || isUpdating}
        />
      </Modal>
    </Layout>
  );
};

export default MenteeListPage;