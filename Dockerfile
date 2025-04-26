# Use the official Nginx image as the base image
FROM nginx:alpine

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Remove the default Nginx index.html
RUN rm -rf ./*

# Copy the local files to the container's working directory
COPY . .

# Set the Nginx configuration to listen on the port specified by the PORT environment variable
RUN sed -i 's/listen       80;/listen       ${PORT};/' /etc/nginx/conf.d/default.conf

# Expose the port the app runs on (default for Cloud Run is 8080)
EXPOSE 8080

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]