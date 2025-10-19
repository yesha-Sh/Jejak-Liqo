import React from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import Input from '../ui/Input';
import Select from '../ui/Select';
import Button from '../ui/Button';
import useAuth from '../../hooks/useAuth';

const meetingSchema = z.object({
  topic: z.string().min(3, 'Topik minimal 3 karakter'),
  meeting_date: z.string().nonempty('Tanggal pertemuan harus diisi'),
  place: z.string().min(3, 'Tempat minimal 3 karakter'),
  notes: z.string().optional(),
  meeting_type: z.enum(['Offline', 'Online']),
  group_id: z.string().nonempty('Grup harus dipilih').transform(Number),
});

const MeetingForm = ({ defaultValues, groups, onSubmit, isLoading }) => {
  const { user } = useAuth();

  // Menambahkan mentor_id secara otomatis ke defaultValues
  const formDefaultValues = {
    ...defaultValues,
    mentor_id: user.id,
    meeting_type: defaultValues?.meeting_type || 'Offline'
  };

  const { register, handleSubmit, formState: { errors } } = useForm({
    resolver: zodResolver(meetingSchema),
    defaultValues: formDefaultValues,
  });

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
      <Input
        id="topic"
        label="Topik / Materi"
        {...register('topic')}
        error={errors.topic}
      />
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
      <div className="grid grid-cols-2 gap-4">
        <Input
          id="meeting_date"
          label="Tanggal Pertemuan"
          type="date"
          {...register('meeting_date')}
          error={errors.meeting_date}
        />
        <Select id="meeting_type" label="Tipe" {...register('meeting_type')} error={errors.meeting_type}>
          <option value="Offline">Offline</option>
          <option value="Online">Online</option>
        </Select>
      </div>
      <Input
        id="place"
        label="Tempat"
        {...register('place')}
        error={errors.place}
      />
      <Input
        id="notes"
        label="Catatan (Opsional)"
        {...register('notes')}
        error={errors.notes}
      />
      <div className="flex justify-end pt-4 border-t mt-6">
        <Button type="submit" disabled={isLoading}>
          {isLoading ? 'Menyimpan...' : 'Simpan'}
        </Button>
      </div>
    </form>
  );
};

export default MeetingForm;