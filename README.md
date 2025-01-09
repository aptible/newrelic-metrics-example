# newrelic-metrics-example

Example Dockerized New Relic Agent with PostgreSQL Metrics Integration for Aptible

## Overview

This repository contains an example setup for monitoring PostgreSQL metrics using the New Relic agent in a Dockerized environment. It is tailored for Aptible deployments, with seamless integration to collect database performance metrics.

## Environment Variables

To configure the New Relic agent and database connections, set the following environment variables:

### `NEW_RELIC_ENV_LABEL`

* **Description**: Specifies the environment tag for your database metrics (e.g., `production`, `staging`)
* **Example**: `production`

### `NEW_RELIC_LICENSE_KEY`

* **Description**: Your New Relic account's license key, required for reporting metrics to New Relic
* **Example**: `1234567890abcdef1234567890abcdef12345678`

### `PSQL_URLS`

* **Description**: A comma-delimited list of PostgreSQL database URLs in the format:
  ```
  postgresql://USER:PASSWORD@HOST:PORT/DB_NAME
  ```
  Multiple database URLs can be provided, separated by commas.

* **Example**:
  ```
  postgresql://user1:password1@db1.example.com:5432/database1,postgresql://user2:password2@db2.example.com:5432/database2
  ```

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/newrelic-metrics-example.git
   ```

2. Navigate to the repository directory:
   ```bash
   cd newrelic-metrics-example
   ```

3. Build the Docker image:
   ```bash
   docker build -t newrelic-metrics-example .
   ```

4. Run the container with the required environment variables:
   ```bash
   docker run -e NEW_RELIC_ENV_LABEL=production \
              -e NEW_RELIC_LICENSE_KEY=1234567890abcdef1234567890abcdef12345678 \
              -e PSQL_URLS="postgresql://user1:password1@db1.example.com:5432/database1,postgresql://user2:password2@db2.example.com:5432/database2" \
              newrelic-metrics-example
   ```

## Notes

* Ensure that the PostgreSQL databases are accessible from the container's network
* The New Relic license key and DB urls must remain confidential; avoid sharing them in public repositories

## License

This project is open-source and available under the MIT License.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request if you have suggestions or improvements.
