import { Component, OnChanges, OnInit } from '@angular/core';
import { Announcement } from '../announcement';
import { AnnouncementService } from '../announcement.service';
import { Help } from '../help-definition/help';
import { HelpService } from '../help-definition/help.service';
import {FormControl} from '@angular/forms';
import {Observable} from 'rxjs';
import {map, startWith} from 'rxjs/operators';

@Component({
  selector: 'app-announcement-list',
  templateUrl: './announcement-list.component.html',
  styleUrls: ['./announcement-list.component.scss']
})
export class AnnouncementListComponent implements OnInit {

  public annonces: Announcement[] = [];
  public helps: Help[] = [];
  myMatiereControl = new FormControl();
  matiere: string[] = ['Java', 'C', 'C++', 'Python', 'Programmation Fonctionnel'];
  filteredMatiere!: Observable<string[]>;
  myFiliereControl = new FormControl();
  filiere: string[] = ['SI3', 'SI4', 'SI5-IHM', 'M2I-IHM', 'SI5-AL'];
  filteredFiliere!: Observable<string[]>;
  filterFiliere: string = '';
  filterMatiere: string = '';
  
  constructor(private annonceService: AnnouncementService, private helpService: HelpService) { 
    this.initializeAnnoucementsData();
    this.initializeHelpsData();
  }

  ngOnInit() {
    this.filteredMatiere = this.myMatiereControl.valueChanges.pipe(
      startWith(''),
      map(value => this._filterMatiere(value)),
    );
    this.filteredFiliere = this.myFiliereControl.valueChanges.pipe(
      startWith(''),
      map(value => this._filterFiliere(value)),
    );
    this.myMatiereControl.valueChanges.subscribe((value) => {
      this.annonces = this.annonces.filter(annonce => annonce.matiere?.includes(value));
      if(!value) {
        this.initializeAnnoucementsData();
      }
    });
    this.myFiliereControl.valueChanges.subscribe((value) => {
      this.annonces = this.annonces.filter(annonce => annonce.filiere?.includes(value));
      if(!value) {
        this.initializeAnnoucementsData();
      }
    });
  }

  initializeAnnoucementsData() {
    this.annonceService.annonces$.subscribe((annonces) => this.annonces = annonces);
  }

  initializeHelpsData() {
    this.helpService.helps$.subscribe((helps) => this.helps = helps);
  }

  private _filterMatiere(value: string): string[] {
    this.filterMatiere = value.toLowerCase();
    return this.matiere.filter(matiere => matiere.toLowerCase().includes(this.filterMatiere));
  }

  private _filterFiliere(value: string): string[] {
    this.filterMatiere = value.toLowerCase();
    return this.filiere.filter(filiere => filiere.toLowerCase().includes(this.filterFiliere));
  }

}
