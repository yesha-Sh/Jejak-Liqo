import axiosClient from './axiosClient';

export const getAnnouncements = () => {
  return axiosClient.get('/announcements');
};

export const createAnnouncement = (announcementData) => {
  return axiosClient.post('/announcements', announcementData);
};

export const deleteAnnouncement = (id) => {
  return axiosClient.delete(`/announcements/${id}`);
};