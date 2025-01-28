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
  postgresql://USER:PASSWORD@HOST:PORT/DB_NAME|DATABASE_HANDLE|ENVIRONMENT_LABEL
  ```
  Multiple database URLs can be provided, separated by commas.

* **Example**:
  ```
  postgresql://user1:password1@db1.example.com:5432/database1|database-instance-1|test,postgresql://user2:password2@db2.example.com:5432/database2|database-instance-2|staging
  ```

## Local Usage

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

## Using with Aptible

Follow these steps to deploy the New Relic metrics agent on Aptible:

1. Clone the repository:
   ```bash
   git clone https://github.com/aptible/newrelic-metrics-example.git
   cd newrelic-metrics-example
   ```

2. Create a new Aptible app (`newrelic-metrics` is just a sample name used in this example):
   ```bash
   aptible apps:create newrelic-metrics
   ```

3. Add Aptible as a remote:
   ```bash
   git remote add aptible git@beta.aptible.com:app-name/newrelic-metrics.git
   ```

4. Configure the app environment, substituting your own values below:
   ```bash
   aptible config:set --app newrelic-metrics \
     NEW_RELIC_ENV_LABEL=production \
     NEW_RELIC_LICENSE_KEY=your-license-key \
     PSQL_URLS=your-database-urls
   ```

5. Deploy to Aptible:
   ```bash
   git push aptible main
   ```

## Notes

* Ensure that the PostgreSQL databases are accessible from the container's network
* The New Relic license key and database urls must remain confidential; avoid sharing them in public repositories

## License

This project is open-source and available under the MIT License.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request if you have suggestions or improvements.
