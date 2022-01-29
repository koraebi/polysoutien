import { User } from "./user";

export interface Announcement {
    user: User;
    id: Number;
    matiere: String;
    description: String;
    salle: String;
    date: String;
    duree: Number;
}
