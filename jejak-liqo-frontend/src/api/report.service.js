import axiosClient from './axiosClient';

/**
 * Get all reports history (jika masih ingin keep riwayat laporan)
 */
export const getReports = () => {
  return axiosClient.get('/reports');
};

/**
 * Generate report dengan background job (sistem lama)
 */
export const generateReport = (reportData) => {
  return axiosClient.post('/reports/generate', reportData);
};

/**
 * Generate & Download Report Langsung (PDF atau Excel)
 * @param {Object} params - Filter parameters
 * @param {string} params.type - Jenis laporan (attendance_summary, meeting_activity, dll)
 * @param {string} params.format - Format file (pdf atau xlsx)
 * @param {string} params.start_date - Tanggal mulai (YYYY-MM-DD)
 * @param {string} params.end_date - Tanggal akhir (YYYY-MM-DD)
 * @param {string} params.group_id - ID kelompok (optional)
 * @param {string} params.mentor_id - ID mentor (optional)
 */
export const downloadReport = async (params) => {
  try {
    const response = await axiosClient.get('/reports/download', {
      params,
      responseType: 'blob', // Penting untuk download file
    });

    // Kode ini HANYA berjalan jika response sukses (bukan 500)
    const contentDisposition = response.headers['content-disposition'];
    let filename = `Laporan_${params.type}_${params.start_date}_${params.end_date}.${params.format}`;
    
    if (contentDisposition) {
      const filenameMatch = contentDisposition.match(/filename="?(.+)"?/);
      if (filenameMatch) {
        filename = filenameMatch[1];
      }
    }

    const url = window.URL.createObjectURL(new Blob([response.data]));
    const link = document.createElement('a');
    link.href = url;
    link.setAttribute('download', filename);
    document.body.appendChild(link);
    link.click();
    
    link.parentNode.removeChild(link);
    window.URL.revokeObjectURL(url);

    return { success: true, filename };

  } catch (error) {
    console.error('Download error:', error.response);

    // [PERBAIKAN] Kode untuk membaca pesan error dari backend
    if (error.response && error.response.data instanceof Blob && error.response.data.type === 'application/json') {
      try {
        // Ubah Blob error (JSON) menjadi teks, lalu parse
        const errorText = await error.response.data.text();
        const errorJson = JSON.parse(errorText);
        console.error('Pesan Error Server:', errorJson.message);
        // Lempar pesan error yang sebenarnya dari server
        throw new Error(errorJson.message || 'Gagal memproses laporan di server');
      } catch (parseError) {
        // Fallback jika parsing gagal
        throw new Error('Gagal mengunduh laporan dan membaca pesan error server.');
      }
    }
    
    // Fallback error jika errornya bukan Blob
    throw new Error(error.response?.data?.message || 'Gagal mengunduh laporan');
  }
};

/**
 * Get available groups untuk filter
 */
export const getGroups = () => {
  return axiosClient.get('/groups');
};

/**
 * Get available mentors untuk filter
 */
export const getMentors = () => {
  return axiosClient.get('/users?role=mentor');
};

/**
 * Preview report data sebelum download (optional)
 */
export const previewReport = (params) => {
  return axiosClient.get('/reports/preview', { params });
};

/**
 * Get report statistics untuk dashboard
 */
export const getReportStats = (params) => {
  return axiosClient.get('/reports/stats', { params });
};