import axiosClient from './axiosClient';

export const getDashboardStats = () => {
  // Ganti endpoint ini jika backend memiliki endpoint khusus dashboard
  // Untuk saat ini, kita akan hit beberapa endpoint
  return Promise.all([
    axiosClient.get('/users?role=mentor'),
    axiosClient.get('/mentees'),
    axiosClient.get('/groups'),
  ]).then(([mentors, mentees, groups]) => ({
      mentors: mentors.data.total,
      mentees: mentees.data.total,
      groups: groups.data.total,
  }));
};