-- Crear tabla para Autores

CREATE TABLE Autores (
    AutorID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Nacionalidad VARCHAR(100)
);

-- Crear tabla para Libros
CREATE TABLE Libros (
    LibroID INT PRIMARY KEY,
    Titulo VARCHAR(100),
    AutorID INT,
    Genero VARCHAR(50),
    ISBN VARCHAR(20),
    Disponibilidad BOOLEAN,
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

-- Crear tabla para Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(255),
    Email VARCHAR(100),
    Telefono VARCHAR(20)
);

-- Crear tabla para Préstamos
CREATE TABLE Prestamos (
    PrestamoID INT PRIMARY KEY,
    UsuarioID INT,
    LibroID INT,
    FechaPrestamo DATE,
    FechaDevolucionEsperada DATE,
    Estado VARCHAR(50),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (LibroID) REFERENCES Libros(LibroID)
);

-- Crear tabla para Devoluciones
CREATE TABLE Devoluciones (
    DevolucionID INT PRIMARY KEY,
    PrestamoID INT,
    FechaDevolucion DATE,
    Estado VARCHAR(50),
    FOREIGN KEY (PrestamoID) REFERENCES Prestamos(PrestamoID)
);

-- Insertar datos de ejemplo en la tabla Autores
INSERT INTO Autores (AutorID, Nombre, Nacionalidad) VALUES
(1, 'Gabriel Garcia Marquez', 'Colombiano'),
(2, 'Mario Vargas Llosa', 'Peruano');

-- Insertar datos de ejemplo en la tabla Libros
INSERT INTO Libros (LibroID, Titulo, AutorID, Genero, ISBN, Disponibilidad) VALUES
(1, 'Cien años de soledad', 1, 'Realismo mágico', '978-0307474727', TRUE),
(2, 'La ciudad y los perros', 2, 'Novela', '978-8401424790', TRUE);

-- Insertar datos de ejemplo en la tabla Usuarios
INSERT INTO Usuarios (UsuarioID, Nombre, Direccion, Email, Telefono) VALUES
(1, 'Juan Perez', 'Calle Principal 123', 'juan@example.com', '123-456-7890'),
(2, 'Maria Lopez', 'Avenida Central 456', 'maria@example.com', '987-654-3210');

-- Insertar datos de ejemplo en la tabla Prestamos
INSERT INTO Prestamos (PrestamoID, UsuarioID, LibroID, FechaPrestamo, FechaDevolucionEsperada, Estado) VALUES
(1, 1, 1, '2024-01-01', '2024-01-15', 'Activo'),
(2, 2, 2, '2024-01-05', '2024-01-20', 'Activo');

-- Insertar datos de ejemplo en la tabla Devoluciones
INSERT INTO Devoluciones (DevolucionID, PrestamoID, FechaDevolucion, Estado) VALUES
(1, 1, '2024-01-14', 'Completado'),
(2, 2, '2024-01-25', 'Pendiente');
