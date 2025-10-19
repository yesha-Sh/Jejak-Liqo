import React from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import Input from '../ui/Input';
import Button from '../ui/Button';
import Card from '../ui/Card'; 

const announcementSchema = z.object({
  title: z.string().min(5, 'Judul minimal 5 karakter'),
  content: z.string().min(10, 'Isi pengumuman minimal 10 karakter'),
});

const AnnouncementForm = ({ onSubmit, isLoading }) => {
  const { register, handleSubmit, formState: { errors }, reset } = useForm({
    resolver: zodResolver(announcementSchema),
  });

  const handleFormSubmit = (data) => {
    onSubmit(data);
    reset();
  };

  return (
    <Card>
      <form onSubmit={handleSubmit(handleFormSubmit)} className="space-y-4">
        <h3 className="text-lg font-semibold">Buat Pengumuman Baru</h3>
        <Input
          id="title"
          label="Judul"
          {...register('title')}
          error={errors.title}
        />
        <div>
           <label htmlFor="content" className="block text-sm font-medium text-gray-700">
             Isi Pengumuman
           </label>
           <textarea
             id="content"
             rows={4}
             className={`mt-1 block w-full px-3 py-2 border rounded-md shadow-sm focus:ring-primary focus:border-primary sm:text-sm ${errors.content ? 'border-red-500' : 'border-gray-300'}`}
             {...register('content')}
           ></textarea>
            {errors.content && <p className="mt-1 text-xs text-red-500">{errors.content.message}</p>}
        </div>
        <div className="flex justify-end">
          <Button type="submit" disabled={isLoading}>
            {isLoading ? 'Mengirim...' : 'Kirim Pengumuman'}
          </Button>
        </div>
      </form>
    </Card>
  );
};

export default AnnouncementForm;