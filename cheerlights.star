load("render.star", "render")
load("http.star", "http")

URL = http://api.thingspeak.com/channels/1417/field/2/last.json

def main():
    rep = http.get(URL)
    if rep.status_code != 200:
    fail("Cheerlights failed with status code %d" % rep.status_code)

    color = rep.json()["field2"]

    return render.Root(
        child = render.Text("The CheerLights color is: %d" % color)
    )
