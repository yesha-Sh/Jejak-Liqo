import axiosClient from './axiosClient';

export const getGroups = () => {
  return axiosClient.get('/groups');
};

export const createGroup = (groupData) => {
  return axiosClient.post('/groups', groupData);
};

export const updateGroup = (id, groupData) => {
  return axiosClient.put(`/groups/${id}`, groupData);
};

export const deleteGroup = (id) => {
  return axiosClient.delete(`/groups/${id}`);
};