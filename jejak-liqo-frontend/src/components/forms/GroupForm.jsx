import React from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import Input from '../ui/Input';
import Select from '../ui/Select';
import Button from '../ui/Button';

const groupSchema = z.object({
  group_name: z.string().min(3, 'Nama grup minimal 3 karakter'),
  description: z.string().optional(),
  mentor_id: z.string().nonempty('Mentor harus dipilih').transform(Number),
});

const GroupForm = ({ defaultValues, mentors, onSubmit, isLoading }) => {
  const { register, handleSubmit, formState: { errors } } = useForm({
    resolver: zodResolver(groupSchema),
    defaultValues,
  });

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
      <Input
        id="group_name"
        label="Nama Grup"
        {...register('group_name')}
        error={errors.group_name}
      />
      <Input
        id="description"
        label="Deskripsi (Opsional)"
        {...register('description')}
        error={errors.description}
      />
      <Select 
        id="mentor_id" 
        label="Pilih Mentor" 
        {...register('mentor_id')} 
        error={errors.mentor_id}
      >
        <option value="">-- Pilih seorang mentor --</option>
        {mentors?.map((mentor) => (
          <option key={mentor.id} value={mentor.id}>
            {mentor.full_name}
          </option>
        ))}
      </Select>
      <div className="flex justify-end pt-4">
        <Button type="submit" disabled={isLoading}>
          {isLoading ? 'Menyimpan...' : 'Simpan'}
        </Button>
      </div>
    </form>
  );
};

export default GroupForm;