import axiosClient from './axiosClient';

export const getMeetings = (params) => {
  return axiosClient.get('/meetings', { params });
};

export const createMeeting = (meetingData) => {
  return axiosClient.post('/meetings', meetingData);
};

export const updateMeeting = (id, meetingData) => {
  return axiosClient.put(`/meetings/${id}`, meetingData);
};

export const deleteMeeting = (id) => {
  return axiosClient.delete(`/meetings/${id}`);
};

export const getMeetingById = (id) => {
  return axiosClient.get(`/meetings/${id}`);
};