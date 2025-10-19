<?php

namespace App\Jobs;

use App\Models\Report;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Storage;
use Throwable;

class GenerateReportJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * The report instance.
     *
     * @var \App\Models\Report
     */
    public $report;

    /**
     * Create a new job instance.
     */
    public function __construct(Report $report)
    {
        $this->report = $report;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        try {
            // Placeholder for actual data fetching logic based on report type and filters
            $data = [
                'title' => 'Laporan ' . ucwords(str_replace('_', ' ', $this->report->type)),
                'filters' => $this->report->filters,
                'generated_at' => now()->toDateTimeString(),
                'items' => [], // Populate this with actual data
            ];
            
            // Dummy data
            for ($i = 1; $i <= 20; $i++) {
                $data['items'][] = ['id' => $i, 'name' => 'Data Item ' . $i, 'value' => rand(100, 1000)];
            }

            $pdf = Pdf::loadView('reports.template', compact('data'));
            $filename = 'report-' . $this->report->id . '-' . time() . '.pdf';
            $path = 'reports/' . $this->report->user_id . '/' . $filename;

            Storage::disk('public')->put($path, $pdf->output());

            $this->report->update([
                'status' => 'completed',
                'file_path' => $path,
            ]);

        } catch (Throwable $e) {
            $this->report->update(['status' => 'failed']);
            // Optionally log the error
            report($e);
        }
    }
}