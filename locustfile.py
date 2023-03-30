# host=test
from locust import HttpUser, task, between


class QuickstartUser(HttpUser):
    wait_time = between(1, 2.5)

    @task
    def on_start(self):
        headers = {
            "Accept-Language": "en"
        }
        self.client.get("/constants?list=all", headers=headers)
