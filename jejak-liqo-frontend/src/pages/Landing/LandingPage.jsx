import React, { useState, useEffect } from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import { BookOpen, Users, TrendingUp, Award, ChevronRight, Eye, EyeOff, CheckCircle, BarChart3, FileText, Clock } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import f1 from '../../assets/img/f1.jpeg';
import f2 from '../../assets/img/f2.jpeg';
import f3 from '../../assets/img/f3.jpeg';
import f4 from '../../assets/img/f4.jpeg';

const LandingPage = () => {
  const [activeTestimonial, setActiveTestimonial] = useState(0);
  const navigate = useNavigate();

  const features = [
    {
      icon: BookOpen,
      title: 'Pencatatan Digital',
      desc: 'Catat absensi dan materi mentoring secara digital, praktis dan mudah diakses kapan saja',
    },
    {
      icon: BarChart3,
      title: 'Laporan Otomatis',
      desc: 'Generate laporan bulanan, triwulan, dan tahunan secara otomatis tanpa input manual',
    },
    {
      icon: TrendingUp,
      title: 'Dashboard Real-time',
      desc: 'Monitor aktivitas mentoring dan progres mentee secara langsung dan real-time',
    },
    {
      icon: FileText,
      title: 'Ekspor Laporan',
      desc: 'Export laporan dalam format PDF atau Excel untuk dokumentasi dan distribusi',
    },
  ];

  const benefits = [
    'Menghemat waktu admin hingga 70% dalam rekapitulasi data',
    'Mengurangi human error dalam pencatatan kehadiran',
    'Transparansi data untuk semua stakeholder',
    'Monitoring real-time aktivitas pementor',
    'Laporan terstruktur dan profesional',
    'Akses mudah dari berbagai perangkat',
  ];

  const testimonials = [
    {
      name: 'Admin Yayasan Shaf',
      role: 'Administrator',
      text: 'Jejak Liqo sangat membantu dalam mengelola data mentoring. Yang tadinya butuh berjam-jam, sekarang hanya beberapa menit!',
    },
    {
      name: 'Ustadz Ahmad',
      role: 'Pementor',
      text: 'Interface yang mudah digunakan, proses pelaporan jadi lebih cepat dan efisien. Sangat recommended!',
    },
  ];

  // Fungsi ketika tombol "Masuk" diklik
  const onLoginClick = () => {
    navigate('/login');
  };
  return (
    <div className="min-h-screen bg-gradient-to-br from-sky-50 via-blue-50 to-cyan-50">
      {/* Navbar */}
      <nav className="bg-white/80 backdrop-blur-md shadow-sm sticky top-0 z-50">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <div className="flex items-center space-x-3">
              <div className="w-12 h-12 bg-gradient-to-br from-sky-500 to-blue-600 rounded-xl flex items-center justify-center shadow-lg">
                <BookOpen className="w-7 h-7 text-white" />
              </div>
              <div>
                <span className="text-2xl font-bold text-gray-900">Jejak Liqo</span>
                <p className="text-xs text-gray-600">Sistem Absensi Mentoring</p>
              </div>
            </div>
            <button
              onClick={onLoginClick}
              className="px-6 py-2.5 bg-gradient-to-r from-sky-500 to-blue-600 text-white rounded-lg font-semibold shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105"
            >
              Masuk
            </button>
          </div>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="container mx-auto px-4 py-20">
        <div className="grid lg:grid-cols-2 gap-12 items-center">
          <div className="space-y-8">
            <div className="inline-block px-4 py-2 bg-sky-100 text-sky-700 rounded-full text-sm font-semibold">
              ✨ Solusi Digital untuk Mentoring
            </div>
            
            <h1 className="text-5xl lg:text-6xl font-bold text-gray-900 leading-tight">
              Kelola Program
              <span className="block text-transparent bg-clip-text bg-gradient-to-r from-sky-500 to-blue-600">
                Mentoring Liqo
              </span>
              dengan Lebih Mudah
            </h1>

            <p className="text-xl text-gray-600 leading-relaxed">
              Platform terpadu untuk pencatatan absensi, monitoring aktivitas, dan pembuatan laporan otomatis. 
              Hemat waktu, tingkatkan efisiensi, dan wujudkan transparansi program mentoring Anda.
            </p>

            <div className="flex flex-wrap gap-4">
              <button
                onClick={onLoginClick}
                className="px-8 py-4 bg-gradient-to-r from-sky-500 to-blue-600 text-white rounded-xl font-semibold shadow-xl hover:shadow-2xl transition-all duration-300 hover:scale-105 flex items-center space-x-2"
              >
                <span>Mulai Sekarang</span>
                <ChevronRight className="w-5 h-5" />
              </button>
              
            </div>

            {/* Stats */}
            <div className="grid grid-cols-3 gap-8 pt-8 border-t border-sky-200">
              <div>
                <div className="text-3xl font-bold text-sky-600">100%</div>
                <div className="text-sm text-gray-600">Otomatis</div>
              </div>
              <div>
                <div className="text-3xl font-bold text-blue-600">Real-time</div>
                <div className="text-sm text-gray-600">Monitoring</div>
              </div>
              <div>
                <div className="text-3xl font-bold text-cyan-600">Transparan</div>
                <div className="text-sm text-gray-600">Pelaporan</div>
              </div>
            </div>
          </div>

          {/* Hero Image */}
          <div className="relative">
            <div className="relative z-10">
              <img
                src={f2}
                alt="Mentoring Activity"
                className="rounded-3xl shadow-2xl w-full h-auto"
              />
              
              {/* Floating Cards */}
              <div className="absolute -bottom-6 -left-6 bg-white rounded-2xl shadow-xl p-4 max-w-xs">
                <div className="flex items-center space-x-3">
                  <div className="w-12 h-12 bg-sky-100 rounded-xl flex items-center justify-center">
                    <CheckCircle className="w-6 h-6 text-sky-600" />
                  </div>
                  <div>
                    <div className="font-bold text-gray-900">1000+ Sesi</div>
                    <div className="text-sm text-gray-600">Tercatat Digital</div>
                  </div>
                </div>
              </div>

              <div className="absolute -top-6 -right-6 bg-white rounded-2xl shadow-xl p-4">
                <div className="flex items-center space-x-3">
                  <div className="w-12 h-12 bg-blue-100 rounded-xl flex items-center justify-center">
                    <Users className="w-6 h-6 text-blue-600" />
                  </div>
                  <div>
                    <div className="font-bold text-gray-900">50+ Mentee</div>
                    <div className="text-sm text-gray-600">Aktif Terdaftar</div>
                  </div>
                </div>
              </div>
            </div>

            {/* Background Decoration */}
            <div className="absolute top-1/4 -left-12 w-64 h-64 bg-sky-200 rounded-full blur-3xl opacity-30"></div>
            <div className="absolute bottom-1/4 -right-12 w-64 h-64 bg-blue-200 rounded-full blur-3xl opacity-30"></div>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-20 bg-white">
        <div className="container mx-auto px-4">
          <div className="text-center mb-16">
            <div className="inline-block px-4 py-2 bg-sky-100 text-sky-700 rounded-full text-sm font-semibold mb-4">
              Fitur Unggulan
            </div>
            <h2 className="text-4xl lg:text-5xl font-bold text-gray-900 mb-4">
              Semua yang Anda Butuhkan
            </h2>
            <p className="text-xl text-gray-600 max-w-2xl mx-auto">
              Platform lengkap untuk mengelola seluruh aspek program mentoring Anda
            </p>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
            {features.map((feature, idx) => (
              <div
                key={idx}
                className="group bg-gradient-to-br from-sky-50 to-blue-50 rounded-2xl p-8 hover:shadow-2xl transition-all duration-300 hover:-translate-y-2 border border-sky-100"
              >
                <div className="w-16 h-16 bg-gradient-to-br from-sky-500 to-blue-600 rounded-2xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform shadow-lg">
                  <feature.icon className="w-8 h-8 text-white" />
                </div>
                <h3 className="text-xl font-bold text-gray-900 mb-3">{feature.title}</h3>
                <p className="text-gray-600 leading-relaxed">{feature.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Benefits Section */}
      <section className="py-20 bg-gradient-to-br from-sky-500 to-blue-600">
        <div className="container mx-auto px-4">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            <div>
              <div className="inline-block px-4 py-2 bg-white/20 text-white rounded-full text-sm font-semibold mb-4">
                Keuntungan
              </div>
              <h2 className="text-4xl lg:text-5xl font-bold text-white mb-6">
                Mengapa Jejak Liqo?
              </h2>
              <p className="text-xl text-white/90 mb-8">
                Transformasi digital yang membawa dampak nyata untuk program mentoring Anda
              </p>
              
              <div className="space-y-4">
                {benefits.map((benefit, idx) => (
                  <div key={idx} className="flex items-start space-x-3 bg-white/10 backdrop-blur-sm rounded-xl p-4">
                    <CheckCircle className="w-6 h-6 text-white flex-shrink-0 mt-0.5" />
                    <span className="text-white text-lg">{benefit}</span>
                  </div>
                ))}
              </div>
            </div>

            <div className="relative">
              <img
                src={f3}
                alt="Benefits"
                className="rounded-2xl shadow-2xl"
              />
            </div>
          </div>
        </div>
      </section>

      {/* Testimonials Section */}
      <section className="py-20 bg-white">
        <div className="container mx-auto px-4">
          <div className="text-center mb-16">
            <div className="inline-block px-4 py-2 bg-sky-100 text-sky-700 rounded-full text-sm font-semibold mb-4">
              Testimoni
            </div>
            <h2 className="text-4xl lg:text-5xl font-bold text-gray-900 mb-4">
              Dipercaya oleh Banyak Pengguna
            </h2>
          </div>

          <div className="max-w-4xl mx-auto">
            <div className="bg-gradient-to-br from-sky-50 to-blue-50 rounded-3xl p-12 shadow-xl">
              <div className="text-center">
                <div className="text-6xl text-sky-500 mb-6">"</div>
                <p className="text-2xl text-gray-700 mb-8 italic">
                  {testimonials[activeTestimonial].text}
                </p>
                <div>
                  <div className="font-bold text-xl text-gray-900">
                    {testimonials[activeTestimonial].name}
                  </div>
                  <div className="text-sky-600">{testimonials[activeTestimonial].role}</div>
                </div>
              </div>

              <div className="flex justify-center space-x-2 mt-8">
                {testimonials.map((_, idx) => (
                  <button
                    key={idx}
                    onClick={() => setActiveTestimonial(idx)}
                    className={`w-3 h-3 rounded-full transition-all ${
                      idx === activeTestimonial ? 'bg-sky-500 w-8' : 'bg-sky-200'
                    }`}
                  />
                ))}
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 bg-gradient-to-br from-sky-50 via-blue-50 to-cyan-50">
        <div className="container mx-auto px-4">
          <div className="max-w-4xl mx-auto text-center">
            <h2 className="text-4xl lg:text-5xl font-bold text-gray-900 mb-6">
              Siap Memulai Transformasi Digital?
            </h2>
            <p className="text-xl text-gray-600 mb-8">
              Bergabunglah dengan ratusan program mentoring yang telah menggunakan Jejak Liqo
            </p>
            <button
              onClick={onLoginClick}
              className="px-12 py-5 bg-gradient-to-r from-sky-500 to-blue-600 text-white text-lg rounded-xl font-bold shadow-2xl hover:shadow-3xl transition-all duration-300 hover:scale-105"
            >
              Masuk ke Dashboard
            </button>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-gray-900 text-white py-12">
        <div className="container mx-auto px-4">
          <div className="grid md:grid-cols-3 gap-8">
            <div>
              <div className="flex items-center space-x-2 mb-4">
                <div className="w-10 h-10 bg-gradient-to-br from-sky-500 to-blue-600 rounded-lg flex items-center justify-center">
                  <BookOpen className="w-6 h-6 text-white" />
                </div>
                <span className="text-xl font-bold">Jejak Liqo</span>
              </div>
              <p className="text-gray-400">
                Sistem absensi dan laporan mentoring yang modern dan efisien
              </p>
            </div>
            
            <div>
              <h4 className="font-bold mb-4">Tentang</h4>
              <ul className="space-y-2 text-gray-400">
                <li>SMK Negeri 1 Cimahi</li>
                <li>Rekayasa Perangkat Lunak</li>
                <li>Yayasan Shaf Pembangunan</li>
              </ul>
            </div>

            <div>
              <h4 className="font-bold mb-4">Kontak</h4>
              <p className="text-gray-400">
                Untuk informasi lebih lanjut, hubungi administrator
              </p>
            </div>
          </div>

          <div className="border-t border-gray-800 mt-8 pt-8 text-center text-gray-400">
            <p>© 2025 Jejak Liqo - SMK Negeri 1 Cimahi. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  );
};

const App = () => {
  const [showLogin, setShowLogin] = useState(false);

  if (showLogin) {
    return <LoginPage onBack={() => setShowLogin(false)} />;
  }

  return <LandingPage onLoginClick={() => setShowLogin(true)} />;
};

export default App;