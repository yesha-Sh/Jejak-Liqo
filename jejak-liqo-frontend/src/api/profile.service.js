import axiosClient from './axiosClient';

export const updateProfile = (profileData) => {
  // Karena mungkin ada upload file (gambar profil), kita gunakan FormData
  const formData = new FormData();
  
  Object.keys(profileData).forEach(key => {
    // Hanya append jika nilainya ada
    if (profileData[key]) {
      formData.append(key, profileData[key]);
    }
  });

  // Laravel memerlukan method spoofing untuk PUT dengan FormData
  formData.append('_method', 'PUT');

  return axiosClient.post('/profile', formData, {
    headers: {
      'Content-Type': 'multipart/form-data',
    },
  });
};