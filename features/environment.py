import requests


def after_scenario(context, scenario):
    #after_scerio use for run like tear down after each scenarios finished but when put condition check
    #only has library tag will run this tear down
    if "library" in scenario.tags:

        response_deleteBook = requests.post('http://216.10.245.166/Library/DeleteBook.php', json={

            "ID": context.bookId
        }, headers={"Content-Type": "application/json"},
                                        )

        assert response_deleteBook.status_code == 200
        res_json = response_deleteBook.json()

        print(res_json["msg"])
        assert res_json["msg"] == "book is successfully deleted"

