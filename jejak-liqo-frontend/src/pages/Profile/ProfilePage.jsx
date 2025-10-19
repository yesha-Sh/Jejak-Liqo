import React from 'react';
import { useForm } from 'react-hook-form';
import { useMutation, useQueryClient } from '@tanstack/react-query';
import { updateProfile } from '../../api/profile.service.js';
import useAuth from '../../hooks/useAuth';
import Layout from '../../components/layout/Layout';
import Card from '../../components/ui/Card';
import Input from '../../components/ui/Input';
import Button from '../../components/ui/Button';

const ProfilePage = () => {
  const { user, login } = useAuth(); // Kita butuh 'login' untuk update state lokal
  const queryClient = useQueryClient();
  const { register, handleSubmit, formState: { errors } } = useForm({
    defaultValues: {
      full_name: user?.full_name,
      email: user?.email,
      phone_number: user?.phone_number,
    },
  });

  const { mutate: updateProfileMutation, isLoading } = useMutation({
    mutationFn: updateProfile,
    onSuccess: (response) => {
        alert('Profil berhasil diperbarui!');
        // Update user data di AuthContext dan localStorage
        const updatedUser = response.data;
        localStorage.setItem('user', JSON.stringify(updatedUser));
        // Trigger re-render dengan data baru
        queryClient.setQueryData(['user'], updatedUser); 
    },
    onError: (err) => alert(`Gagal: ${err.response?.data?.message || err.message}`),
  });

  const onSubmit = (data) => {
    updateProfileMutation(data);
  };

  return (
    <Layout title="Profil Saya">
      <div className="max-w-3xl mx-auto space-y-6">
        <Card>
          <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
            <h3 className="text-lg font-semibold">Informasi Profil</h3>
            <Input
              id="full_name"
              label="Nama Lengkap"
              {...register('full_name')}
              error={errors.full_name}
            />
            <Input
              id="email"
              label="Email"
              {...register('email')}
              error={errors.email}
              disabled
            />
            <Input
              id="phone_number"
              label="Nomor Telepon"
              {...register('phone_number')}
              error={errors.phone_number}
            />
            <div className="flex justify-end">
              <Button type="submit" disabled={isLoading}>
                {isLoading ? 'Menyimpan...' : 'Simpan Perubahan'}
              </Button>
            </div>
          </form>
        </Card>

        {/* Form ganti password bisa ditambahkan di sini sebagai Card terpisah */}
      </div>
    </Layout>
  );
};

export default ProfilePage;