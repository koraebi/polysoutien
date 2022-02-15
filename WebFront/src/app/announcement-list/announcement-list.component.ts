import { Component, OnInit } from '@angular/core';
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
  
  constructor(private annonceService: AnnouncementService, private helpService: HelpService) { 
    this.annonceService.annonces$.subscribe((annonces) => this.annonces = annonces);
    this.helpService.helps$.subscribe((helps) => this.helps = helps);
  }

  myMatiereControl = new FormControl();
  matiere: string[] = ['Java', 'C', 'C++', 'Python', 'Programmation Fonctionnel'];
  filteredMatiere!: Observable<string[]>;
  myFiliereControl = new FormControl();
  filiere: string[] = ['SI5-IHM', 'M2I-IHM', 'SI5-AL', 'SI4'];
  filteredFiliere!: Observable<string[]>;

  ngOnInit() {
    this.filteredMatiere = this.myMatiereControl.valueChanges.pipe(
      startWith(''),
      map(value => this._filterMatiere(value)),
    );
    this.filteredFiliere = this.myFiliereControl.valueChanges.pipe(
      startWith(''),
      map(value => this._filterFiliere(value)),
    );
  }

  private _filterMatiere(value: string): string[] {
    const filterValue = value.toLowerCase();

    return this.matiere.filter(matiere => matiere.toLowerCase().includes(filterValue));
  }

  private _filterFiliere(value: string): string[] {
    const filterValue = value.toLowerCase();

    return this.filiere.filter(filiere => filiere.toLowerCase().includes(filterValue));
  }

}
