import React from 'react';
import Card from '../../components/ui/Card';
import Layout from '../../components/layout/Layout';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { getAnnouncements, createAnnouncement, deleteAnnouncement } from '../../api/announcement.service';
import AnnouncementForm from '../../components/forms/AnnouncementForm';
import useAuth from '../../hooks/useAuth';
import { format } from 'date-fns';
import { id } from 'date-fns/locale';
import { Trash2 } from 'lucide-react';

const AnnouncementListPage = () => {
  const { user } = useAuth();
  const queryClient = useQueryClient();
  const isAdmin = user?.role === 'admin' || user?.role === 'super_admin';

  const { data: announcementsData, isLoading } = useQuery({
    queryKey: ['announcements'],
    queryFn: getAnnouncements,
  });

  const { mutate: createAnnouncementMutation, isLoading: isCreating } = useMutation({
    mutationFn: createAnnouncement,
    onSuccess: () => {
      alert('Pengumuman berhasil dibuat');
      queryClient.invalidateQueries(['announcements']);
    },
    onError: (err) => alert(`Gagal: ${err.message}`),
  });
  
  const { mutate: deleteAnnouncementMutation } = useMutation({
    mutationFn: deleteAnnouncement,
    onSuccess: () => {
      alert('Pengumuman berhasil dihapus');
      queryClient.invalidateQueries(['announcements']);
    },
     onError: (err) => alert(`Gagal: ${err.message}`),
  });
  
  const handleDelete = (id) => {
    if (window.confirm('Yakin ingin menghapus pengumuman ini?')) {
        deleteAnnouncementMutation(id);
    }
  }

  return (
    <Layout title="Pengumuman">
      <div className="space-y-6">
        {isAdmin && (
          <AnnouncementForm
            onSubmit={createAnnouncementMutation}
            isLoading={isCreating}
          />
        )}

        <h2 className="text-xl font-semibold">Daftar Pengumuman</h2>
        {isLoading ? <p>Loading...</p> : (
          <div className="space-y-4">
            {announcementsData?.data?.length > 0 ? (
              announcementsData.data.map((ann) => (
                <Card key={ann.id}>
                    <div className="flex justify-between items-start">
                        <div>
                            <h3 className="text-lg font-semibold text-primary">{ann.title}</h3>
                            <p className="text-xs text-gray-500">
                                Dibuat oleh {ann.creator.full_name} pada {format(new Date(ann.created_at), 'd MMMM yyyy, HH:mm', { locale: id })}
                            </p>
                        </div>
                        {isAdmin && (
                            <button onClick={() => handleDelete(ann.id)} className="p-1 text-red-500 hover:text-red-700">
                                <Trash2 size={18} />
                            </button>
                        )}
                    </div>
                  <p className="mt-4 text-gray-700 whitespace-pre-wrap">{ann.content}</p>
                </Card>
              ))
            ) : (
              <p className="text-gray-500">Belum ada pengumuman.</p>
            )}
          </div>
        )}
      </div>
    </Layout>
  );
};

export default AnnouncementListPage;