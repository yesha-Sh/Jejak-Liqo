import React from 'react';
import { NavLink } from 'react-router-dom';
import useAuth from '../../hooks/useAuth';
import {
  LayoutDashboard,
  Users,
  User,
  Book,
  Calendar,
  LogOut,
  Megaphone,
  FileText, // ✅ Tambahan FileText untuk menu laporan
} from 'lucide-react';

const Sidebar = () => {
  const { user, logout } = useAuth();

  // ✅ Tambahkan menu Laporan & Pengumuman
  const navLinks = [
    { to: '/dashboard', text: 'Dashboard', icon: <LayoutDashboard size={20} />, roles: ['super_admin', 'admin', 'mentor'] },
    { to: '/announcements', text: 'Pengumuman', icon: <Megaphone size={20} />, roles: ['super_admin', 'admin', 'mentor'] },
    { to: '/users', text: 'Manajemen User', icon: <Users size={20} />, roles: ['super_admin', 'admin'] },
    { to: '/groups', text: 'Manajemen Grup', icon: <Book size={20} />, roles: ['admin'] },
    { to: '/mentees', text: 'Manajemen Mentee', icon: <User size={20} />, roles: ['admin', 'mentor'] },
    { to: '/meetings', text: 'Manajemen Pertemuan', icon: <Calendar size={20} />, roles: ['admin', 'mentor'] },
    { to: '/reports', text: 'Laporan', icon: <FileText size={20} />, roles: ['super_admin', 'admin', 'mentor'] }, // ✅ Tambahan menu laporan
  ];

  const filteredNavLinks = navLinks.filter(link => link.roles.includes(user?.role));

  const linkClass =
    'flex items-center px-4 py-2.5 text-gray-700 rounded-lg hover:bg-primary/10 hover:text-primary transition-colors';
  const activeLinkClass =
    'flex items-center px-4 py-2.5 bg-primary/10 text-primary font-semibold rounded-lg';

  return (
    <aside className="flex flex-col w-64 h-screen px-4 py-8 bg-white border-r">
      <h2 className="text-2xl font-bold text-center text-primary">JejakLiqo</h2>

      <div className="flex flex-col justify-between flex-1 mt-6">
        <nav className="flex-1 space-y-2">
          {filteredNavLinks.map((link) => (
            <NavLink
              key={link.to}
              to={link.to}
              className={({ isActive }) => (isActive ? activeLinkClass : linkClass)}
            >
              {link.icon}
              <span className="mx-4">{link.text}</span>
            </NavLink>
          ))}
        </nav>

        <div>
          <button onClick={logout} className={`${linkClass} w-full`}>
            <LogOut size={20} />
            <span className="mx-4">Logout</span>
          </button>
        </div>
      </div>
    </aside>
  );
};

export default Sidebar;
