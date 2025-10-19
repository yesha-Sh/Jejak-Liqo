import axiosClient from './axiosClient';

export const getMentees = (params) => {
  return axiosClient.get('/mentees', { params });
};

export const createMentee = (menteeData) => {
  return axiosClient.post('/mentees', menteeData);
};

export const updateMentee = (id, menteeData) => {
  return axiosClient.put(`/mentees/${id}`, menteeData);
};

export const deleteMentee = (id) => {
  return axiosClient.delete(`/mentees/${id}`);
};