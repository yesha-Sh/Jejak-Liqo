import React from 'react';
import Layout from '../../components/layout/Layout';
import { useQuery } from '@tanstack/react-query';
import { getDashboardStats } from '../../api/dashboard.service';
import StatCard from '../../components/ui/StatCard';
import { User, Users, Book } from 'lucide-react';
import useAuth from '../../hooks/useAuth';

const DashboardPage = () => {
  const { user } = useAuth();
  const { data: stats, isLoading, error } = useQuery({
    queryKey: ['dashboardStats'],
    queryFn: getDashboardStats,
    // Hanya fetch data jika user adalah admin
    enabled: user?.role === 'admin' || user?.role === 'super_admin',
  });

  return (
    <Layout title="Dashboard">
      <div className="space-y-6">
        <h1 className="text-xl font-semibold">
          Selamat Datang Kembali, {user?.full_name}!
        </h1>

        {/* Bagian ini hanya untuk Admin & Super Admin */}
        {(user?.role === 'admin' || user?.role === 'super_admin') && (
          <div>
            <h4 className="text-xl font-semibold">Statistik Umum</h4>
            {error && <p className="text-red-500">Gagal memuat statistik.</p>}
            <div className="grid grid-cols-1 gap-6 md:grid-cols-2 lg:grid-cols-3">
              <StatCard 
                icon={<User size={24} />} 
                title="Total Mentor" 
                value={stats?.mentors ?? 0} 
                isLoading={isLoading} 
              />
              <StatCard 
                icon={<Users size={24} />} 
                title="Total Mentee" 
                value={stats?.mentees ?? 0} 
                isLoading={isLoading} 
              />
              <StatCard 
                icon={<Book size={24} />} 
                title="Total Grup" 
                value={stats?.groups ?? 0} 
                isLoading={isLoading} 
              />
            </div>
          </div>
        )}

        {/* Bagian ini hanya untuk Mentor */}
        {user?.role === 'mentor' && (
            <div>
                 <h4 className="text-lg font-semibold text-gray-700 mb-4">Akses Cepat</h4>
                 <p className="text-gray-600">
                    Anda dapat mengelola grup, mentee, dan pertemuan melalui menu di sebelah kiri.
                 </p>
            </div>
        )}

      </div>
    </Layout>
  );
};

export default DashboardPage;