import React from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import Input from '../ui/Input';
import Select from '../ui/Select';
import Button from '../ui/Button';

const menteeSchema = z.object({
  full_name: z.string().min(3, 'Nama lengkap minimal 3 karakter'),
  nickname: z.string().optional(),
  birth_date: z.string().optional(),
  phone_number: z.string().optional(),
  address: z.string().optional(),
  status: z.enum(['Aktif', 'Lulus', 'Nonaktif']),
  group_id: z.string().nonempty('Grup harus dipilih').transform(Number),
});

const MenteeForm = ({ defaultValues, groups, onSubmit, isLoading }) => {
  const { register, handleSubmit, formState: { errors } } = useForm({
    resolver: zodResolver(menteeSchema),
    defaultValues: defaultValues || { status: 'Aktif' },
  });

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="space-y-4 max-h-[70vh] overflow-y-auto pr-2">
      <Input
        id="full_name"
        label="Nama Lengkap"
        {...register('full_name')}
        error={errors.full_name}
      />
      <div className="grid grid-cols-2 gap-4">
        <Input
          id="nickname"
          label="Nama Panggilan"
          {...register('nickname')}
          error={errors.nickname}
        />
        <Input
          id="birth_date"
          label="Tanggal Lahir"
          type="date"
          {...register('birth_date')}
          error={errors.birth_date}
        />
      </div>
       <Input
        id="phone_number"
        label="Nomor Telepon"
        {...register('phone_number')}
        error={errors.phone_number}
      />
       <Input
        id="address"
        label="Alamat"
        {...register('address')}
        error={errors.address}
      />
      <div className="grid grid-cols-2 gap-4">
        <Select 
          id="group_id" 
          label="Pilih Grup" 
          {...register('group_id')} 
          error={errors.group_id}
        >
          <option value="">-- Pilih Grup --</option>
          {groups?.map((group) => (
            <option key={group.id} value={group.id}>
              {group.group_name}
            </option>
          ))}
        </Select>
        <Select id="status" label="Status" {...register('status')} error={errors.status}>
          <option value="Aktif">Aktif</option>
          <option value="Lulus">Lulus</option>
          <option value="Nonaktif">Nonaktif</option>
        </Select>
      </div>
      <div className="flex justify-end pt-4 border-t mt-6">
        <Button type="submit" disabled={isLoading}>
          {isLoading ? 'Menyimpan...' : 'Simpan'}
        </Button>
      </div>
    </form>
  );
};

export default MenteeForm;