import React from 'react';
import { MoreHorizontal } from 'lucide-react';

const Table = ({ columns, data, renderActions }) => {
  return (
    <div className="overflow-x-auto bg-white rounded-lg shadow">
      <table className="min-w-full divide-y divide-gray-200">
        <thead className="bg-gray-50">
          <tr>
            {columns.map((col) => (
              <th key={col.key} scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
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
        <tbody className="bg-white divide-y divide-gray-200">
          {data.length > 0 ? (
            data.map((item) => (
              <tr key={item.id}>
                {columns.map((col) => (
                  <td key={`${item.id}-${col.key}`} className="px-6 py-4 whitespace-nowrap text-sm text-gray-800">
                    {col.render ? col.render(item) : item[col.key]}
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
              <td colSpan={columns.length + (renderActions ? 1 : 0)} className="px-6 py-4 text-center text-gray-500">
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