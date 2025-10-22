import React from 'react';
import { MoreHorizontal } from 'lucide-react';

const Table = ({ columns, data, renderActions }) => {
  return (
    // ✅ Gunakan bg-surface
    <div className="overflow-x-auto bg-surface rounded-lg shadow">
      {/* ✅ Gunakan divide-border */}
      <table className="min-w-full divide-y divide-border">
        {/* ✅ Gunakan bg-surface/50 (sedikit transparan) dan text-muted */}
        <thead className="bg-surface/50">
          <tr>
            {columns.map((col) => (
              <th key={col.key} scope="col" className="px-6 py-3 text-left text-xs font-medium text-muted uppercase tracking-wider">
                {col.header}
              </th>
            ))}
            {renderActions && (
              <th scope="col" className="relative px-6 py-3">
                <span className="sr-only">Actions</span>
              </th>
            )}
          </tr>
        </thead>
        {/* ✅ Gunakan bg-surface dan divide-border */}
        <tbody className="bg-surface divide-y divide-border">
          {data?.length > 0 ? (
            data.map((item) => (
              // ✅ Tambahkan hover background yang sesuai tema
              <tr key={item.id} className="hover:bg-gray-50 dark:hover:bg-white/5">
                {columns.map((col) => (
                  // ✅ Gunakan text-text
                  <td key={`${item.id}-${col.key}`} className="px-6 py-4 whitespace-nowrap text-sm text-text">
                    {/* Render logic */}
                    {col.render ? col.render(item) : item[col.key] === null || item[col.key] === undefined ? '-' : item[col.key]}
                  </td>
                ))}
                {renderActions && (
                  <td className="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                    {renderActions(item)}
                  </td>
                )}
              </tr>
            ))
          ) : (
            <tr>
              {/* ✅ Gunakan text-muted */}
              <td colSpan={columns.length + (renderActions ? 1 : 0)} className="px-6 py-4 text-center text-muted">
                Tidak ada data
              </td>
            </tr>
          )}
        </tbody>
      </table>
    </div>
  );
};

export default Table;