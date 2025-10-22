import React, { useState, useEffect, useRef } from 'react';
import useAuth from '../../hooks/useAuth';
import { Link } from 'react-router-dom';
import { User, LogOut } from 'lucide-react';
import ThemeSwitcher from '../ui/ThemeSwitcher';

const Header = ({ title }) => {
  const { user, logout } = useAuth();
  const [dropdownOpen, setDropdownOpen] = useState(false);
  const dropdownRef = useRef(null);

  useEffect(() => {
    const handleClickOutside = (event) => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
        setDropdownOpen(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  return (
    // ✅ bg-surface
    <header className="w-full px-8 py-4 bg-surface shadow-sm">
      <div className="flex items-center justify-between">
        {/* ✅ text-text */}
        <h1 className="text-2xl font-semibold text-text">{title}</h1>
        <div className="flex items-center gap-4">
          <ThemeSwitcher />
          <div className="relative" ref={dropdownRef}>

            <button onClick={() => setDropdownOpen(!dropdownOpen)} className="flex items-center space-x-3">
              {/* ✅ text-text/80 */}
              <span className="font-medium text-text/80 hidden sm:block">Halo, {user?.full_name}</span>
              <img
                className="w-10 h-10 rounded-full object-cover"
                src={user?.profile_picture_url || `https://ui-avatars.com/api/?name=${user?.full_name}&background=4F46E5&color=fff`} // Avatar tetap
                alt="User avatar"
              />
            </button>

            {dropdownOpen && (
              // ✅ bg-surface, border-border, text-text/90
              <div className="absolute right-0 w-48 py-2 mt-2 bg-surface border border-border rounded-md shadow-xl z-20">
                <Link to="/profile" className="flex items-center w-full px-4 py-2 text-sm text-text/90 hover:bg-primary/10 hover:text-primary">
                  <User size={16} className="mr-2" /> Profil Saya
                </Link>
                <button onClick={logout} className="flex items-center w-full px-4 py-2 text-sm text-text/90 hover:bg-primary/10 hover:text-primary">
                  <LogOut size={16} className="mr-2" /> Logout
                </button>
              </div>
            )}
          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;