import React, { useState } from 'react';
import Layout from '../../components/layout/Layout';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { getGroups, createGroup, updateGroup, deleteGroup } from '../../api/group.service';
import { getUsers } from '../../api/user.service';
import Table from '../../components/ui/Table';
import Button from '../../components/ui/Button';
import Modal from '../../components/ui/Modal';
import GroupForm from '../../components/forms/GroupForm';
import { Edit, Trash2, PlusCircle } from 'lucide-react';

const GroupListPage = () => {
  const queryClient = useQueryClient();
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingGroup, setEditingGroup] = useState(null);

  // Query untuk mendapatkan daftar grup
  const { data: groupsData, isLoading: isLoadingGroups } = useQuery({
    queryKey: ['groups'],
    queryFn: getGroups,
  });

  // Query untuk mendapatkan daftar mentor untuk dropdown form
  const { data: mentorsData, isLoading: isLoadingMentors } = useQuery({
    queryKey: ['mentors'],
    queryFn: () => getUsers({ role: 'mentor' }),
  });

  const { mutate: createGroupMutation, isLoading: isCreating } = useMutation({
    mutationFn: createGroup,
    onSuccess: () => {
      alert('Grup berhasil dibuat');
      queryClient.invalidateQueries(['groups']);
      closeModal();
    },
    onError: (err) => alert(`Gagal: ${err.message}`),
  });
  
  const { mutate: updateGroupMutation, isLoading: isUpdating } = useMutation({
    mutationFn: (data) => updateGroup(editingGroup.id, data),
    onSuccess: () => {
      alert('Grup berhasil diperbarui');
      queryClient.invalidateQueries(['groups']);
      closeModal();
    },
     onError: (err) => alert(`Gagal: ${err.message}`),
  });

  const { mutate: deleteGroupMutation } = useMutation({
    mutationFn: deleteGroup,
    onSuccess: () => {
      alert('Grup berhasil dihapus');
      queryClient.invalidateQueries(['groups']);
    },
    onError: (err) => alert(`Gagal: ${err.message}`),
  });

  const openModalForCreate = () => {
    setEditingGroup(null);
    setIsModalOpen(true);
  };

  const openModalForEdit = (group) => {
    setEditingGroup(group);
    setIsModalOpen(true);
  };

  const closeModal = () => {
    setEditingGroup(null);
    setIsModalOpen(false);
  };
  
  const handleFormSubmit = (data) => {
    editingGroup ? updateGroupMutation(data) : createGroupMutation(data);
  };

  const handleDelete = (id) => {
    if (window.confirm('Yakin ingin menghapus grup ini?')) {
      deleteGroupMutation(id);
    }
  };

  const columns = [
    { key: 'group_name', header: 'Nama Grup' },
    { key: 'description', header: 'Deskripsi' },
    { key: 'mentor_name', header: 'Nama Mentor', render: (item) => item.mentor?.full_name || 'N/A' },
    { key: 'mentees_count', header: 'Jumlah Mentee', render: (item) => item.mentees_count || 0 },
  ];
  
  const isLoading = isLoadingGroups || isLoadingMentors;

  return (
    <Layout title="Manajemen Grup">
      <div className="space-y-4">
        <div className="flex justify-between items-center">
          <h2 className="text-xl font-semibold">Daftar Grup</h2>
          <Button onClick={openModalForCreate}>
            <PlusCircle size={16} className="mr-2" />
            Tambah Grup
          </Button>
        </div>
        {isLoading ? <p>Loading...</p> : (
          <Table
            columns={columns}
            data={groupsData?.data || []}
            renderActions={(group) => (
              <div className="flex space-x-2">
                <button onClick={() => openModalForEdit(group)} className="text-blue-600 hover:text-blue-800"><Edit size={18} /></button>
                <button onClick={() => handleDelete(group.id)} className="text-red-600 hover:text-red-800"><Trash2 size={18} /></button>
              </div>
            )}
          />
        )}
      </div>

      <Modal 
        isOpen={isModalOpen}
        onClose={closeModal}
        title={editingGroup ? 'Edit Grup' : 'Tambah Grup Baru'}
      >
        <GroupForm
          defaultValues={editingGroup}
          mentors={mentorsData?.data?.data || []}
          onSubmit={handleFormSubmit}
          isLoading={isCreating || isUpdating}
        />
      </Modal>
    </Layout>
  );
};

export default GroupListPage;