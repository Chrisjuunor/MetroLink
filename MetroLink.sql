CREATE TABLE Routes (
    route_id INT PRIMARY KEY,
    route_name VARCHAR(50) NOT NULL,
    route_type VARCHAR(20) NOT NULL
);

CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    vehicle_type VARCHAR(20) NOT NULL,
    vehicle_capacity INT NOT NULL
);

CREATE TABLE Stops (
    stop_id INT PRIMARY KEY,
    stop_name VARCHAR(50) NOT NULL,
    stop_lat DECIMAL(9,6) NOT NULL,
    stop_lon DECIMAL(9,6) NOT NULL
);

CREATE TABLE Trips (
    trip_id INT PRIMARY KEY,
    route_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (route_id) REFERENCES Routes(route_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);

CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(50) NOT NULL,
    passenger_email VARCHAR(50) NOT NULL,
    passenger_phone VARCHAR(20) NOT NULL
);

CREATE TABLE Bookings (
    bookings_id INT PRIMARY KEY,
    passenger_id INT NOT NULL,
    trip_id INT NOT NULL,
    reservation_time DATETIME NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id)
);
