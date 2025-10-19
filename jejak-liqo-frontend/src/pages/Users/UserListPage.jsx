import React, { useState } from 'react';
import Layout from '../../components/layout/Layout';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { getUsers, deleteUser, createUser, updateUser } from '../../api/user.service';
import Table from '../../components/ui/Table';
import Button from '../../components/ui/Button';
import Modal from '../../components/ui/Modal';
import UserForm from '../../components/forms/UserForm';
import { Edit, Trash2, PlusCircle } from 'lucide-react';

const UserListPage = () => {
  const queryClient = useQueryClient();
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingUser, setEditingUser] = useState(null);

  const { data: usersData, isLoading, error } = useQuery({
    queryKey: ['users'],
    queryFn: () => getUsers(),
  });

  const { mutate: createUserMutation, isLoading: isCreating } = useMutation({
    mutationFn: createUser,
    onSuccess: () => {
      alert('User berhasil dibuat');
      queryClient.invalidateQueries(['users']);
      closeModal();
    },
    onError: (err) => alert(`Gagal membuat user: ${err.message}`),
  });

  const { mutate: updateUserMutation, isLoading: isUpdating } = useMutation({
    mutationFn: (data) => updateUser(editingUser.id, data),
    onSuccess: () => {
      alert('User berhasil diperbarui');
      queryClient.invalidateQueries(['users']);
      closeModal();
    },
    onError: (err) => alert(`Gagal memperbarui user: ${err.message}`),
  });

  const { mutate: deleteUserMutation } = useMutation({
    mutationFn: deleteUser,
    onSuccess: () => {
      alert('User berhasil dihapus');
      queryClient.invalidateQueries(['users']);
    },
    onError: (err) => alert(`Gagal menghapus user: ${err.message}`),
  });

  const openModalForCreate = () => {
    setEditingUser(null);
    setIsModalOpen(true);
  };

  const openModalForEdit = (user) => {
    setEditingUser(user);
    setIsModalOpen(true);
  };

  const closeModal = () => {
    setEditingUser(null);
    setIsModalOpen(false);
  };

  const handleFormSubmit = (data) => {
    const payload = { ...data };
    if (!payload.password) {
      delete payload.password;
      delete payload.password_confirmation;
    }
    
    if (editingUser) {
      updateUserMutation(payload);
    } else {
      createUserMutation(payload);
    }
  };

  const handleDelete = (id) => {
    if (window.confirm('Apakah Anda yakin ingin menghapus user ini?')) {
      deleteUserMutation(id);
    }
  };

  const columns = [
    { key: 'full_name', header: 'Nama Lengkap' },
    { key: 'email', header: 'Email' },
    { key: 'role', header: 'Peran' },
    { key: 'status', header: 'Status',
      render: (item) => (
        <span className={`px-2 inline-flex text-xs leading-5 font-semibold rounded-full ${
            item.status === 'active' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'
        }`}>{item.status}</span>
      )
    },
  ];

  if (isLoading) return <Layout title="Manajemen User"><p>Loading...</p></Layout>;
  if (error) return <Layout title="Manajemen User"><p>Error: {error.message}</p></Layout>;

  return (
    <Layout title="Manajemen User">
      <div className="space-y-4">
        <div className="flex justify-between items-center">
          <h2 className="text-xl font-semibold">Daftar User</h2>
          <Button onClick={openModalForCreate}>
            <PlusCircle size={16} className="mr-2" />
            Tambah User
          </Button>
        </div>
        <Table
          columns={columns}
          data={usersData?.data?.data || []}
          renderActions={(user) => (
            <div className="flex space-x-2">
              <button onClick={() => openModalForEdit(user)} className="text-blue-600 hover:text-blue-800"><Edit size={18} /></button>
              <button onClick={() => handleDelete(user.id)} className="text-red-600 hover:text-red-800"><Trash2 size={18} /></button>
            </div>
          )}
        />
      </div>
      
      <Modal 
        isOpen={isModalOpen}
        onClose={closeModal}
        title={editingUser ? 'Edit User' : 'Tambah User Baru'}
      >
        <UserForm 
          defaultValues={editingUser}
          onSubmit={handleFormSubmit}
          isLoading={isCreating || isUpdating}
        />
      </Modal>
    </Layout>
  );
};

export default UserListPage;