import time
from locust import HttpUser, between, task


class WebsiteUser(HttpUser):
    wait_time = between(1, 5)
    access_token = None
    realm = "testrealm"
    
    def on_start(self):
        result = self.client.post("/auth/realms/master/protocol/openid-connect/token", {
            "username": "admin",
            "password": "123456",
            "grant_type": "password",
            "client_id": "admin-cli"
        })
        self.access_token = result.json()['access_token']

    @task
    def index(self):
        url = "/auth/admin/realms/{}/users".format(self.realm)
        username_suffix = str(int(time.time()))
        payload = {
            "username": "app-user-{}".format(username_suffix),
            "firstName": "Sergey",
            "lastName": "Kargopolov",
            "email": "test-{}@test.com".format(username_suffix),
            "enabled": "true"
        }
        headers = {
            "Content-Type": "application/json",
            "Authorization": "Bearer {}".format(self.access_token)
        }
        self.client.post(url, json=payload, headers=headers)
