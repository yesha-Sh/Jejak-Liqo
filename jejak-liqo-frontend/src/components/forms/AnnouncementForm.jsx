import React from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import Input from '../ui/Input';
import Button from '../ui/Button';
import Card from '../ui/Card'; // Pastikan Card sudah di-import

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
        {/* ✅ Gunakan text-text */}
        <h3 className="text-lg font-semibold text-text">Buat Pengumuman Baru</h3>
        <Input
          id="title"
          label="Judul"
          {...register('title')}
          error={errors.title}
        />
        <div>
           {/* ✅ Gunakan text-muted */}
           <label htmlFor="content" className="block text-sm font-medium text-muted">
             Isi Pengumuman
           </label>
           <textarea
             id="content"
             rows={4}
             // ✅ Gunakan bg-surface, border-border, text-text
             className={`mt-1 block w-full px-3 py-2 border rounded-md shadow-sm focus:ring-primary focus:border-primary sm:text-sm bg-surface border-border text-text ${
               errors.content ? 'border-red-500' : 'border-border' // Border error tetap merah
              }`}
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