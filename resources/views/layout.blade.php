<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portafolio de José Santizo</title>
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}">
</head>
<body>
    <header>
        <h1>José Santizo</h1>
        <nav>
            <ul>
                <li><a href="/">Inicio</a></li>
                <li><a href="/about">Sobre mí</a></li>
                <li><a href="/projects">Proyectos</a></li>
                <li><a href="/skills">Habilidades</a></li>
                <li><a href="/contact">Contacto</a></li>
            </ul>
        </nav>
    </header>
    <main>
        @yield('content')
    </main>
</body>
</html>
