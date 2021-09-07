from sqlalchemy import Column, Integer, String
from sqlalchemy.sql.schema import ForeignKey
from database import Base
from sqlalchemy.orm import relationship


class Appointment(Base):
    __tablename__ = "Appointments"

    id = Column(Integer, primary_key=True, index=True)
    disease = Column(String)
    syndrome = Column(String)
    disorder = Column(String)
    info = Column(String)
    patient_id = Column(Integer, ForeignKey("Users.id"))

    patient = relationship("User", back_populates="appointment")


class User(Base):
    __tablename__ = "Users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String)
    email = Column(String)
    password = Column(String)

    appointment = relationship("Appointment", back_populates="patient")
