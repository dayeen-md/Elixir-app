from fastapi import FastAPI, Response, status, HTTPException, Depends
import models
import schemas
from sqlalchemy.orm import Session
from typing import List
from database import engine, get_db
from hashing import Hash, verify

models.Base.metadata.create_all(engine)


app = FastAPI()


@app.post('/appointment', status_code=status.HTTP_201_CREATED, tags=["Appointment"])
def create(request: schemas.Appointment, db: Session = Depends(get_db)):
    new_appointment = models.Appointment(
        disease=request.disease, syndrome=request.syndrome, disorder=request.disorder, info=request.info, patient_id=request.patient_id
    )
    db.add(new_appointment)
    db.commit()
    db.refresh(new_appointment)
    return new_appointment


@app.delete('/appointment/{id}', status_code=status.HTTP_204_NO_CONTENT, tags=["Appointment"])
def destroy(id, db: Session = Depends(get_db)):
    appointment = db.query(models.Appointment).filter(
        models.Appointment.id == id)
    if not appointment.first():
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"Appointment with id {id} not found")
    appointment.delete(synchronize_session=False)
    db.commit()
    return "done"


@app.post('/user', response_model=schemas.ShowUser, tags=["User"])
def create_user(request: schemas.User, db: Session = Depends(get_db)):
    new_user = models.User(username=request.username,
                           email=request.email, password=Hash.bcrypt(request.password))
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    return new_user


@app.get('/user/{id}', response_model=schemas.ShowUser, tags=["User"])
def get_user(id: int, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.id == id).first()
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f'User with {id} not found')
    return user


@app.post('/login', tags=["Authentication"])
def login(request: schemas.Login, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(
        models.User.email == request.email).first()
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f'Invalid credentials')
    if not verify(user.password, request.password):
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f'Invalid password')
    return user
