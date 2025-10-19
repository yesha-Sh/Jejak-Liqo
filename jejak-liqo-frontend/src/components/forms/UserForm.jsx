import React from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import Input from '../ui/Input';
import Select from '../ui/Select';
import Button from '../ui/Button';

const userSchema = z.object({
  full_name: z.string().min(3, 'Nama lengkap minimal 3 karakter'),
  email: z.string().email('Email tidak valid'),
  phone_number: z.string().optional(),
  role: z.enum(['admin', 'mentor']),
  status: z.enum(['active', 'inactive']),
  password: z.string().min(8, 'Password minimal 8 karakter').optional().or(z.literal('')),
  password_confirmation: z.string().optional().or(z.literal('')),
}).refine(data => data.password === data.password_confirmation, {
  message: 'Konfirmasi password tidak cocok',
  path: ['password_confirmation'],
});

const UserForm = ({ defaultValues, onSubmit, isLoading }) => {
  const { register, handleSubmit, formState: { errors } } = useForm({
    resolver: zodResolver(userSchema),
    defaultValues: defaultValues || { role: 'mentor', status: 'active' },
  });

  const isEditMode = !!defaultValues;

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
      <Input
        id="full_name"
        label="Nama Lengkap"
        {...register('full_name')}
        error={errors.full_name}
      />
      <Input
        id="email"
        label="Email"
        type="email"
        {...register('email')}
        error={errors.email}
      />
      <Input
        id="phone_number"
        label="Nomor Telepon"
        {...register('phone_number')}
        error={errors.phone_number}
      />
       <div className="grid grid-cols-2 gap-4">
        <Select id="role" label="Peran" {...register('role')} error={errors.role}>
          <option value="mentor">Mentor</option>
          <option value="admin">Admin</option>
        </Select>
        <Select id="status" label="Status" {...register('status')} error={errors.status}>
          <option value="active">Aktif</option>
          <option value="inactive">Tidak Aktif</option>
        </Select>
      </div>
      <p className="text-sm text-gray-500">{isEditMode ? 'Kosongkan password jika tidak ingin mengubahnya.' : 'Password default.'}</p>
      <Input
        id="password"
        label="Password"
        type="password"
        {...register('password')}
        error={errors.password}
      />
      <Input
        id="password_confirmation"
        label="Konfirmasi Password"
        type="password"
        {...register('password_confirmation')}
        error={errors.password_confirmation}
      />
      <div className="flex justify-end pt-4">
        <Button type="submit" disabled={isLoading}>
          {isLoading ? 'Menyimpan...' : 'Simpan'}
        </Button>
      </div>
    </form>
  );
};

export default UserForm;