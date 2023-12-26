# uvicorn main:app --reload --port 7777 --host 0.0.0.0
uvicorn src.app.main:app --port 7777 --host 0.0.0.0 --workers 1 --reload # limit create models
