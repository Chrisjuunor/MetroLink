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

CREATE TABLE Employee (
  employee_id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  job_title VARCHAR(50) NOT NULL,
  hire_date DATE NOT NULL,
  salary DECIMAL(10,2) NOT NULL
);

CREATE TABLE Driver (
  driver_id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  license_number VARCHAR(20) NOT NULL,
  vehicle_assignment VARCHAR(50) NOT NULL,
  shift_schedule VARCHAR(50) NOT NULL
);

CREATE TABLE Payroll (
  payroll_id INT NOT NULL PRIMARY KEY,
  employee_id INT NOT NULL,
  pay_period_start DATE NOT NULL,
  pay_period_end DATE NOT NULL,
  amount_paid DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES Employee (employee_id)
);

INSERT INTO Routes (route_id, route_name, route_type) VALUES
(1, 'Route A', 'Local'),
(2, 'Route B', 'Express'),
(3, 'Route C', 'Local');

INSERT INTO Vehicles (vehicle_id, vehicle_type, vehicle_capacity) VALUES
(1, 'Bus', 50),
(2, 'Mini Bus', 25),
(3, 'Coach', 80);

INSERT INTO Stops (stop_id, stop_name, stop_lat, stop_lon) VALUES
(1, 'Stop 1', 40.7128, -74.0060),
(2, 'Stop 2', 41.8781, -87.6298),
(3, 'Stop 3', 34.0522, -118.2437);

INSERT INTO Trips (trip_id, route_id, vehicle_id, start_time, end_time) VALUES
(1, 1, 1, '2023-05-05 09:00:00', '2023-05-05 10:00:00'),
(2, 2, 2, '2023-05-05 10:00:00', '2023-05-05 11:00:00'),
(3, 3, 3, '2023-05-05 11:00:00', '2023-05-05 12:00:00');

INSERT INTO Passengers (passenger_id, passenger_name, passenger_email, passenger_phone) VALUES
(1, 'John Smith', 'john.smith@example.com', '08024344560'),
(2, 'Jane Doe', 'jane.doe@example.com', '09000033356'),
(3, 'Bob Johnson', 'bob.johnson@example.com', '07067854312');

INSERT INTO Bookings (bookings_id, passenger_id, trip_id, reservation_time) VALUES
(1, 1, 1, '2023-05-05 08:00:00'),
(2, 2, 2, '2023-05-05 09:00:00'),
(3, 3, 3, '2023-05-05 10:00:00');

INSERT INTO Employee (employee_id, first_name, last_name, email, phone_number, job_title, hire_date, salary) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-1234', 'Manager', '2020-01-01', 50000.00),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', 'Assistant Manager', '2021-01-01', 40000.00),
(3, 'Bob', 'Johnson', 'bob.johnson@example.com', '555-9012', 'Driver', '2022-01-01', 30000.00);

INSERT INTO Driver (driver_id, first_name, last_name, license_number, vehicle_assignment, shift_schedule) VALUES
(1, 'David', 'Brown', '12345', 'Bus 1', 'Monday-Friday 8am-5pm'),
(2, 'Sarah', 'Lee', '67890', 'Mini Bus 2', 'Tuesday-Saturday 10am-7pm'),
(3, 'Michael', 'Wilson', '54321', 'Coach 3', 'Wednesday-Sunday 12pm-9pm');

INSERT INTO Payroll (payroll_id, employee_id, pay_period_start, pay_period_end, amount_paid)
VALUES 
  (1, 101, '2022-04-01', '2022-04-15', 50000.00),
  (2, 102, '2022-04-01', '2022-04-15', 60000.00),
  (3, 103, '2022-04-01', '2022-04-15', 70000.00);