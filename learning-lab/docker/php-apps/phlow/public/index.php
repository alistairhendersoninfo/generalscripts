<?php
require __DIR__.'/../vendor/autoload.php';

use Phlow\Model\WorkflowBuilder;
use Phlow\Engine\WorkflowInstance;
use Phlow\Renderer\PlainTextRenderer;

$flow = (new WorkflowBuilder())
    ->start()
    ->callback(function ($data) {
        $data['a'] = rand(1, 25);
        return $data;
    })
    ->callback(function ($data) {
        $data['b'] = rand(1, 25);
        return $data;
    })
    ->callback(function ($data) {
        $data['sum'] = $data['a'] + $data['b'];
        return $data;
    })
    ->end()
    ->getWorkflow();

$instance = new WorkflowInstance($flow, []);
$instance->execute();

$model = (new PlainTextRenderer())->render($flow);
$path = (new PlainTextRenderer())->render($instance);

?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Phlow sequence demo</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@3.4.3/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-slate-100">
    <main class="max-w-2xl mx-auto py-10">
        <div class="bg-white rounded shadow p-6 space-y-4">
            <h1 class="text-2xl font-semibold">Phlow workflow demo</h1>
            <p class="text-slate-600">Each reload executes a simple workflow and shows the execution trace.</p>
            <div>
                <h2 class="text-lg font-semibold mb-2">Results</h2>
                <p class="font-mono">a = <?= $instance->getData()['a']; ?>, b = <?= $instance->getData()['b']; ?>, sum = <?= $instance->getData()['sum']; ?></p>
            </div>
            <div class="grid md:grid-cols-2 gap-4">
                <div>
                    <h3 class="text-sm font-semibold uppercase text-slate-500">Workflow model</h3>
                    <pre class="bg-slate-900 text-slate-100 p-4 rounded text-sm whitespace-pre-wrap"><?= htmlspecialchars($model, ENT_QUOTES); ?></pre>
                </div>
                <div>
                    <h3 class="text-sm font-semibold uppercase text-slate-500">Execution path</h3>
                    <pre class="bg-slate-900 text-slate-100 p-4 rounded text-sm whitespace-pre-wrap"><?= htmlspecialchars($path, ENT_QUOTES); ?></pre>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
