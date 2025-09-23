<?php
require __DIR__ . '/vendor/autoload.php';

use EngineWorks\Pivot\Formatters\XhtmlTable;
use EngineWorks\Pivot\QueryResult;
use EngineWorks\Pivot\Result;

function buildResultTree(): array {
    $root = new Result('region', 'All Regions', ['sales' => 0, 'orders' => 0]);
    $regions = [
        'North' => [
            ['channel' => 'Online', 'sales' => 8000, 'orders' => 18],
            ['channel' => 'Store', 'sales' => 7000, 'orders' => 12],
        ],
        'South' => [
            ['channel' => 'Online', 'sales' => 6000, 'orders' => 14],
            ['channel' => 'Store', 'sales' => 9000, 'orders' => 16],
        ],
        'West' => [
            ['channel' => 'Online', 'sales' => 7500, 'orders' => 20],
            ['channel' => 'Store', 'sales' => 6500, 'orders' => 10],
        ],
    ];

    foreach ($regions as $region => $entries) {
        $regionTotals = ['sales' => 0, 'orders' => 0];
        $regionNode = new Result('region', $region, null, true);
        foreach ($entries as $entry) {
            $regionTotals['sales'] += $entry['sales'];
            $regionTotals['orders'] += $entry['orders'];
            $channelNode = new Result('channel', $entry['channel'], [
                'sales' => number_format($entry['sales'], 0),
                'orders' => $entry['orders'],
            ]);
            $channelNode->parent = $regionNode;
            $regionNode->children->addItem($channelNode, $entry['channel']);
        }
        $regionNode->values = [
            'sales' => number_format($regionTotals['sales'], 0),
            'orders' => $regionTotals['orders'],
        ];
        $regionNode->parent = $root;
        $root->children->addItem($regionNode, $region);
        $root->values['sales'] += $regionTotals['sales'];
        $root->values['orders'] += $regionTotals['orders'];
    }

    $root->values['sales'] = number_format($root->values['sales'], 0);
    return [$root, array_keys($regions)];
}

[$root, $regionNames] = buildResultTree();
$aggregates = [
    ['caption' => 'Sales', 'asname' => 'sales'],
    ['caption' => 'Orders', 'asname' => 'orders'],
];
$rows = [
    ['fieldname' => 'region', 'caption' => 'Region'],
    ['fieldname' => 'channel', 'caption' => 'Channel'],
];

$queryResult = new QueryResult($root, null, $rows, [], $aggregates);
$table = (new XhtmlTable([
    'table-class' => 'table-auto w-full border border-slate-200',
    'row-class' => 'border-b border-slate-200',
    'total-class' => 'font-semibold bg-slate-100',
    'column-total-caption' => 'Totals',
    'row-total-caption' => 'All Regions',
]))->asXhtmlTable($queryResult);

?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>EngineWorks Pivot demo</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@3.4.3/dist/tailwind.min.css" rel="stylesheet" />
</head>
<body class="bg-slate-100">
  <main class="max-w-4xl mx-auto py-10 space-y-6">
    <section class="bg-white rounded shadow p-6 space-y-4">
      <h1 class="text-2xl font-semibold">EngineWorks Pivot</h1>
      <p class="text-slate-600">Example pivot showing sales and order totals by region and channel using the <code>engineworks-pivot</code> formatter.</p>
      <div class="overflow-x-auto">
        <?= $table; ?>
      </div>
    </section>
  </main>
</body>
</html>
