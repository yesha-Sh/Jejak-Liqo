import React from 'react';
import Sidebar from './Sidebar';
import Header from './Header';

const Layout = ({ children, title }) => {
  return (
    // ✅ Pastikan elemen terluar menggunakan bg-background
    <div className="flex h-screen bg-background">
      <Sidebar />
      <div className="flex flex-col flex-1 overflow-hidden"> {/* Tambahkan overflow-hidden */}
        <Header title={title} />
        {/* ✅ Area main konten bisa scroll jika perlu */}
        <main className="flex-1 p-6 md:p-8 lg:p-10 overflow-y-auto">
          {children}
        </main>
      </div>
    </div>
  );
};

export default Layout;