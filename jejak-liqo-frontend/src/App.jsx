import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import LandingPage from './pages/Landing/LandingPage';
import LoginPage from './pages/Auth/LoginPage';
import DashboardPage from './pages/Dashboard/DashboardPage';
import UserListPage from './pages/Users/UserListPage';
import GroupListPage from './pages/Groups/GroupListPage';
import MenteeListPage from './pages/Mentees/MenteeListPage';
import MeetingListPage from './pages/Meetings/MeetingListPage';
import AttendancePage from './pages/Attendances/AttendancePage'; 
import AnnouncementListPage from './pages/Announcements/AnnouncementListPage'; 
import ReportListPage from './pages/Reports/ReportListPage'; 
import ProfilePage from './pages/Profile/ProfilePage'; 
import ProtectedRoute from './routes/ProtectedRoute';
import RoleRoute from './routes/RoleRoute';
import useAuth from './hooks/useAuth';

function App() {
  const { isAuthenticated } = useAuth();

  return (
    <Routes>
      {/* --- Public Route --- */}

<Route path="/" element={<LandingPage />} />

      {/* --- Public Route --- */}
      <Route
        path="/login"
        element={isAuthenticated ? <Navigate to="/dashboard" /> : <LoginPage />}
      />

      {/* --- Authenticated Routes --- */}
      <Route
        path="/dashboard"
        element={
          <ProtectedRoute>
            <DashboardPage />
          </ProtectedRoute>
        }
      />

      <Route
        path="/users"
        element={
          <ProtectedRoute>
            <RoleRoute allowedRoles={['super_admin', 'admin']}>
              <UserListPage />
            </RoleRoute>
          </ProtectedRoute>
        }
      />

      <Route
        path="/groups"
        element={
          <ProtectedRoute>
            <RoleRoute allowedRoles={['admin']}>
              <GroupListPage />
            </RoleRoute>
          </ProtectedRoute>
        }
      />

      <Route
        path="/mentees"
        element={
          <ProtectedRoute>
            <RoleRoute allowedRoles={['admin', 'mentor']}>
              <MenteeListPage />
            </RoleRoute>
          </ProtectedRoute>
        }
      />

      {/* ✅ Manajemen Pertemuan */}
      <Route
        path="/meetings"
        element={
          <ProtectedRoute>
            <RoleRoute allowedRoles={['admin', 'mentor']}>
              <MeetingListPage />
            </RoleRoute>
          </ProtectedRoute>
        }
      />

      {/* ✅ Absensi per Pertemuan */}
      <Route
        path="/meetings/:meetingId/attendance"
        element={
          <ProtectedRoute>
            <RoleRoute allowedRoles={['admin', 'mentor']}>
              <AttendancePage />
            </RoleRoute>
          </ProtectedRoute>
        }
      />

      {/* ✅ Pengumuman */}
      <Route
        path="/announcements"
        element={
          <ProtectedRoute>
            <AnnouncementListPage />
          </ProtectedRoute>
        }
      />

      {/* ✅ Laporan */}
      <Route
        path="/reports"
        element={
          <ProtectedRoute>
            <RoleRoute allowedRoles={['admin', 'mentor', 'super_admin']}>
              <ReportListPage />
            </RoleRoute>
          </ProtectedRoute>
        }
      />

      {/* ✅ Profil Pengguna */}
      <Route
        path="/profile"
        element={
          <ProtectedRoute>
            <ProfilePage />
          </ProtectedRoute>
        }
      />

      {/* --- Redirect Default --- */}
      <Route
        path="*"
        element={<Navigate to={isAuthenticated ? '/dashboard' : '/login'} />}
      />
    </Routes>
  );
}

export default App;
