from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


DATABASE_URL='postgresql://postgres:root1234@localhost:5432/sound_of_meme'

engine= create_engine(DATABASE_URL)

SessionLocal = sessionmaker(autocommit = False, autoflush=False, bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

        