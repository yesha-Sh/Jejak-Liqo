import React from 'react';
import { X } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';

const Modal = ({ isOpen, onClose, title, children }) => {
  return (
    <AnimatePresence>
      {isOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
          {/* Backdrop */}
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            className="absolute inset-0 bg-black/50" // Backdrop tetap
            onClick={onClose}
          />

          {/* Modal Content */}
          <motion.div
            initial={{ y: 50, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            exit={{ y: 50, opacity: 0 }}
            transition={{ type: 'spring', stiffness: 300, damping: 30 }}
            // ✅ Menggunakan bg-surface
            className="relative w-full max-w-lg p-6 bg-surface rounded-lg shadow-xl"
          >
            {/* ✅ Border-border, text-text */}
            <div className="flex items-center justify-between pb-4 border-b border-border">
              <h3 className="text-lg font-semibold text-text">{title}</h3>
              <button
                onClick={onClose}
                // ✅ text-muted, hover background lebih halus
                className="p-1 text-muted rounded-full hover:bg-black/5 dark:hover:bg-white/5 hover:text-text"
              >
                <X size={20} />
              </button>
            </div>
            <div className="mt-4">{children}</div>
          </motion.div>
        </div>
      )}
    </AnimatePresence>
  );
};

export default Modal;