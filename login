<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login Protegido | Injective</title>
    <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
    <style>
        body { background: #000; color: #fff; font-family: sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .login-card { background: #111; padding: 40px; border-radius: 12px; border: 1px solid #00f2ff; width: 300px; text-align: center; }
        input { width: 100%; padding: 12px; margin: 10px 0; background: #222; border: 1px solid #333; color: #fff; border-radius: 6px; box-sizing: border-box; }
        button { width: 100%; padding: 12px; background: #00f2ff; border: none; font-weight: bold; cursor: pointer; border-radius: 6px; }
    </style>
</head>
<body>
    <div class="login-card">
        <h2>Panel Injective</h2>
        <input type="email" id="email" placeholder="Correo Electrónico">
        <input type="password" id="pass" placeholder="Contraseña">
        <button onclick="login()">Iniciar Sesión</button>
    </div>

    <script>
        const _supabase = supabase.createClient('URL', 'KEY');

        async function login() {
            const email = document.getElementById('email').value;
            const password = document.getElementById('pass').value;

            const { data, error } = await _supabase.auth.signInWithPassword({
                email: email,
                password: password,
            });

            if (error) {
                alert("Acceso denegado: " + error.message);
            } else {
                // Supabase guarda la sesión automáticamente en el LocalStorage
                window.location.href = 'admin.html';
            }
        }
    </script>
</body>
</html>
