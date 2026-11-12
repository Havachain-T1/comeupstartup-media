<?php

namespace Tests;

use Illuminate\Foundation\Testing\TestCase as BaseTestCase;

abstract class TestCase extends BaseTestCase
{
    use CreatesApplication;

    protected function setUp(): void
    {
        // The visitor tracker (TrackVisitor middleware helpers) reads $_SERVER directly, which the CLI does not populate.
        $_SERVER['REMOTE_ADDR'] = $_SERVER['REMOTE_ADDR'] ?? '192.0.2.10';
        $_SERVER['HTTP_USER_AGENT'] = $_SERVER['HTTP_USER_AGENT'] ?? 'Mozilla/5.0 (X11; Linux x86_64) Chrome/120.0 PHPUnit';

        parent::setUp();
    }
}
