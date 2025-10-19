import axiosClient from './axiosClient';

// Backend route kita didesain untuk menyimpan absensi secara massal
export const saveBulkAttendance = (data) => {
  return axiosClient.post('/attendances/bulk', data);
};