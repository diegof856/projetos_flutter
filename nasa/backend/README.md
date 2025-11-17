# NasaAPI Backend

This is a Spring Boot application that provides a backend for the NasaAPI project.

## Technologies Used

*   Java 21
*   Spring Boot 3.5.7
*   Maven
*   H2 Database (in-memory)

## How to Run the Project

1.  **Navigate to the backend directory:**

    ```bash
    cd backend
    ```

2.  **Build the project using Maven:**

    ```bash
    ./mvnw clean install
    ```

    On Windows, you might need to use `mvnw.cmd` instead of `./mvnw`:

    ```bash
    mvnw.cmd clean install
    ```

3.  **Run the Spring Boot application:**

    ```bash
    ./mvnw spring-boot:run
    ```

    On Windows:

    ```bash
    mvnw.cmd spring-boot:run
    ```

    The application will start on port 8080 by default.

## H2 Database Console

The H2 database console is enabled for development purposes.

*   **Access URL:** `http://localhost:8080/h2-console`
*   **JDBC URL:** `jdbc:h2:mem:testdb`
*   **Username:** `sa`
*   **Password:** (leave blank)

## API Endpoints

The application exposes the following endpoints under `/user`:

*   `POST /user`: Create a new user.
*   `PUT /user/{id}`: Update an existing user.
*   `DELETE /user/{id}`: Delete a user by ID.
*   `GET /user/{id}`: Get user details by ID, including NASA API events for the current year.
*   `GET /user?ano={year}`: Get NASA API events for a specific year.
